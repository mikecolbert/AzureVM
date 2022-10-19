#!/bin/bash

# Update apt cache.
sudo apt-get update

# Install Nginx.
ECHO "Installing Nginx"
sudo apt-get install -y nginx
ECHO "Installing Git"
sudo apt install -y git-all 

# clone the repository.
#curl https://raw.githubusercontent.com/mikecolbert/AzureVM/main/index.html | sudo tee -a /var/www/html/index.html
cd /var/www/html
ECHO "Cloning portfolio"
git clone https://github.com/mikecolbert/my_portfolio.git
ECHO "Copying files into web directory"
cp my_portfolio/* /var/www/html/*
ECHO "Deleting .github folder"
rm -R /var/www/html/.github


