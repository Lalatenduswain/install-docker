# Docker Installation Script for Ubuntu

This script automates the process of installing Docker on an Ubuntu system. It follows the steps outlined below to ensure a smooth and hassle-free installation of Docker.

## Usage

1. Make sure you have the necessary permissions to execute the script.
2. Run the script using the following command:

    ```bash    
    git clone https://github.com/Lalatenduswain/install-docker.git
    cd install-docker
    chmod +x install_docker.sh
    ./install_docker.sh
    ```

3. Follow the prompts and instructions provided by the script.

## Steps Covered by the Script

### Step 1: Update Package Repositories

The script updates the package repositories to ensure the latest software versions are available.

### Step 2: Install Dependencies

Installs the required dependencies, including `apt-transport-https`, `ca-certificates`, `curl`, and `software-properties-common`.

### Step 3: Add Docker Repository

Adds Docker's official GPG key and repository to your system, allowing you to install Docker from official sources.

### Step 4: Install Docker

Updates the package list again and then installs Docker Community Edition.

### Step 5: Start and Enable Docker

Starts the Docker service and sets it to start automatically on boot.

### Step 6: Verify Installation

Verifies that Docker is installed by displaying its version.

### Step 7: Manage Docker as a Non-root User (Optional)

If desired, adds your user to the `docker` group to run Docker commands without root privileges.

## Note

- Ensure that you review the script and understand the actions it performs before executing it.
- Always back up your important data before making system-wide changes.
- This script is intended for Ubuntu systems. Make sure you're using a compatible version.

## Author

Feel free to modify the README as needed to provide additional context, usage instructions, or any other relevant information.

**Note:** Make sure to have the necessary permissions and dependencies set up before running this script.

## Donations

If you want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

## Disclaimer

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.


## License

This project is licensed under the [MIT License](LICENSE).
