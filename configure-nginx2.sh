#!/bin/bash

# Update apt cache.
sudo apt-get update

# Install Nginx.
sudo apt-get install -y nginx
sudo apt install -y git-all 

# clone the repository.
#curl https://raw.githubusercontent.com/mikecolbert/AzureVM/main/index.html | sudo tee -a /var/www/html/index.html
cd /var/www/html
git clone https://github.com/mikecolbert/my_portfolio.git
mv /my_portfolio/* ../*
