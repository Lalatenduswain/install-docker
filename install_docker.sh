#!/bin/bash

# Exit on any error
set -e

echo "🚀 Starting Docker installation..."

# Detect OS family
if [[ ! -f /etc/os-release ]]; then
    echo "❌ This script requires /etc/os-release. Exiting."
    exit 1
fi

source /etc/os-release

if grep -q "ID_LIKE.*debian\|ID=ubuntu\|ID=debian" /etc/os-release 2>/dev/null; then
    echo "🖥️  Detected Debian-based system ($ID $VERSION_ID)"
    PKG_MGR="apt"
    INSTALL_CMD="sudo apt-get install -y"
    REMOVE_CMD="sudo apt-get remove -y"
    UPDATE_CMD="sudo apt-get update"
    REPO_URL_BASE="https://download.docker.com/linux"
    CODENAME="$VERSION_CODENAME"
elif grep -q "ID_LIKE.*rhel\|ID=fedora\|ID=centos\|ID=rhel" /etc/os-release 2>/dev/null; then
    echo "🖥️  Detected RPM-based system ($ID $VERSION_ID)"
    PKG_MGR="dnf"
    INSTALL_CMD="sudo dnf install -y"
    REMOVE_CMD="sudo dnf remove -y"
    UPDATE_CMD="sudo dnf check-update"
    # Set repo distro
    if [[ "$ID" == "centos" ]]; then
        REPO_DISTRO="centos"
    elif [[ "$ID" == "rhel" ]]; then
        REPO_DISTRO="rhel"
    else
        REPO_DISTRO="$ID"  # fedora or others
    fi
else
    echo "❌ Unsupported OS: $ID. This script supports Debian/Ubuntu and RHEL/Fedora/CentOS. Exiting."
    exit 1
fi

# Step 1: Uninstall Old/Conflicting Versions
echo "🗑️  Removing old or conflicting Docker packages..."
if [[ "$PKG_MGR" == "apt" ]]; then
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
        if dpkg -l | grep -q "^ii  $pkg "; then
            $REMOVE_CMD "$pkg"
        fi
    done
else
    for pkg in docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate \
               docker-logrotate docker-engine podman runc docker-selinux docker-engine-selinux; do
        if rpm -q "$pkg" >/dev/null 2>&1; then
            $REMOVE_CMD "$pkg"
        fi
    done
fi

# Step 2: Update Repositories
echo "📦 Updating package repositories..."
$UPDATE_CMD

# Step 3: Install Dependencies
echo "🔧 Installing required dependencies..."
if [[ "$PKG_MGR" == "apt" ]]; then
    $INSTALL_CMD ca-certificates curl gnupg
else
    $INSTALL_CMD dnf-plugins-core
fi

# Step 4: Add Docker Repository
echo "📂 Setting up Docker's official repository..."
if [[ "$PKG_MGR" == "apt" ]]; then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc  # Use ubuntu gpg for debian too, as per common practice
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] $REPO_URL_BASE/${ID:-ubuntu} \
      $CODENAME stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    $UPDATE_CMD
else
    sudo dnf config-manager --add-repo https://download.docker.com/linux/$REPO_DISTRO/docker-ce.repo
fi

# Step 5: Install Docker and Related Packages
echo "📦 Installing Docker..."
if [[ "$PKG_MGR" == "apt" ]]; then
    $INSTALL_CMD docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    $INSTALL_CMD docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# Step 6: Start and Enable Docker Service
echo "▶️  Starting and enabling Docker service..."
sudo systemctl enable docker --now

# Step 7: Verify Docker Installation
echo "✅ Verifying installation..."
docker --version
docker compose version
sudo docker run --rm hello-world

# Step 8: Add Current User to Docker Group (Optional, for non-root usage)
echo "👤 Adding user to docker group (requires logout/login to take effect)..."
sudo usermod -aG docker $USER

# Optional: Quick test without logout
echo "💡 Tip: Run 'newgrp docker' to apply group changes without logging out."

echo "🎉 Docker & Docker Compose v2 installed successfully!"
echo "🔄 Please log out and log back in (or run 'newgrp docker') to use Docker without sudo."
