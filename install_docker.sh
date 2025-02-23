#!/bin/bash

# Step 1: Update Package Repositories
sudo apt update -y && sudo apt upgrade -y

# Step 2: Install Dependencies
sudo apt install -y ca-certificates curl gnupg

# Step 3: Add Docker Repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 4: Install Docker and Related Packages
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 5: Start and Enable Docker Service
sudo systemctl enable docker --now

# Step 6: Verify Docker Installation
docker --version
docker compose version

# Step 7: Add Current User to Docker Group (Optional)
sudo usermod -aG docker $USER

echo "✅ Docker & Docker Compose installed successfully!"
echo "🔄 Please log out and log back in to apply the group membership changes."
