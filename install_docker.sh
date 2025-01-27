#!/bin/bash

# Step 1: Update Package Repositories
sudo apt update

# Step 2: Install Dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add Docker Repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 4: Install Docker
sudo apt update
sudo apt install -y docker-ce

# Step 5: Start and Enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Step 6: Install Docker Compose Plugin (v2)
sudo apt install -y docker-compose-plugin

# Step 7: Verify Docker and Docker Compose Installation
docker --version
docker compose version

# Step 8: Manage Docker as a Non-root User (Optional)
sudo usermod -aG docker $USER
echo "Please log out and log back in to apply the group membership changes."

echo "Docker and Docker Compose installation and setup completed."
