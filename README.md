# 🚀 Docker CLI & Docker Compose Installation Script for Ubuntu

This script automates the installation of **Docker** and **Docker Compose** on an Ubuntu system. It ensures a **hassle-free** setup by following the best practices for installing Docker from its official repository.

## 📌 Features
- Installs the latest **Docker Engine** & **Docker Compose**
- Configures Docker to start on boot
- Adds your user to the **Docker group** (optional)
- Ensures a secure installation using **official GPG keys**
- Fully automated script with minimal user intervention

---

## 📖 Installation Guide

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/Lalatenduswain/install-docker.git
cd install-docker
```

### **2️⃣ Run the Script**
```bash
chmod +x install_docker.sh
./install_docker.sh
```

### **3️⃣ Follow the Instructions**
- The script will automatically install **Docker & Docker Compose**
- **Log out and log back in** to apply group membership changes

---

## 🔧 Steps Covered by the Script

### ✅ Step 1: Update Package Repositories
Updates the system's package list to ensure the latest versions of software are installed.

### ✅ Step 2: Install Dependencies
Installs essential packages:
- `ca-certificates`
- `curl`
- `gnupg`

### ✅ Step 3: Add Docker’s Official Repository
Adds Docker’s **GPG key** and **repository** to ensure a trusted installation.

### ✅ Step 4: Install Docker & Docker Compose
Installs the latest versions of:
- `docker-ce` (Docker Community Edition)
- `docker-ce-cli` (Docker Command Line Interface)
- `containerd.io`
- `docker-buildx-plugin`
- `docker-compose-plugin`

### ✅ Step 5: Start & Enable Docker
Starts Docker immediately and enables it to launch on boot.

### ✅ Step 6: Verify Installation
Checks that Docker and Docker Compose are installed correctly by displaying their versions.

### ✅ Step 7: Add User to Docker Group (Optional)
Allows running Docker without `sudo` by adding your user to the **docker** group.

---

## ⚠️ Important Notes
- **Compatible OS**: This script is designed for Ubuntu-based systems only.
- **Use at Your Own Risk**: Always **review** the script before running it.
- **Backup Recommended**: Before making system-wide changes, ensure you have **backups**.

---

## 💖 Support & Donations
If you found this useful, you can support me by **buying me a coffee** ☕

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support-blue?style=flat&logo=buy-me-a-coffee)](https://www.buymeacoffee.com/lalatendu.swain)

---

## 📜 License
This project is licensed under the **[MIT License](LICENSE)**. Feel free to use, modify, and distribute it as needed.

---

### 🔗 Connect with Me
🐦 Twitter: [@lalatendu_swain](https://x.com/lalatenduswain)
💼 LinkedIn: [Lalatendu Swain](https://linkedin.com/in/lalatenduswain)

🚀 **Enjoy Dockerizing your applications!**
