#! /bin/bash

# The main case here will be to install Docker and K8s including all other
# relating dependencies.
# Tired of install all this through Docker docs and having to write 
# line by line each time.


# First I am going to start with Docker.

# Uninstall all old Docker versions.

echo "Removal started of old Docker versions..."
wait 1
sudo apt-get remove docker docker-engine docker.io containerd runc

wait 4
echo "Removal done!"
wait 2

echo "Starting installs..."
wait 1
echo "Update the apt package index and install packages to allow apt to use a repository over HTTPS:"
sudo apt-get Update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release


wait 2

echo "Add Docker s official GPG key:"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

wait 2

echo "Set up the repository:"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

wait 2

echo "Update apt index and Install Docker Engine"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin