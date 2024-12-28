#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e
# Update and upgrade system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y
# Install Git and Ansible
echo "Installing Git and Ansible..."
sudo apt install -y git ansible
# Clone the repository containing the Ansible playbook
GIT_REPO_URL="https://github.com/H-ADJI/.dotfiles"
LOCAL_REPO_DIR="/tmp/ansible-setup"

echo "Cloning the repository from $GIT_REPO_URL..."
if [ -d "$LOCAL_REPO_DIR" ]; then
  rm -rf "$LOCAL_REPO_DIR"
fi
git clone --depth=1 "$GIT_REPO_URL" "$LOCAL_REPO_DIR"

# Run the Ansible playbook
ANSIBLE_PLAYBOOK="$LOCAL_REPO_DIR/main.yml"
echo "Running the Ansible playbook..."
if [ -f "$ANSIBLE_PLAYBOOK" ]; then
  ansible-playbook "$ANSIBLE_PLAYBOOK"
else
  echo "Error: Ansible playbook not found at $ANSIBLE_PLAYBOOK"
  exit 1
fi
# Clean up the cloned repository (optional)
echo "Cleaning up..."
rm -rf "$LOCAL_REPO_DIR"

echo "Setup completed successfully!"
