#!/bin/bash

# Update apt cache.
sudo apt-get update

# Install Nginx.
sudo apt-get install -y nginx
sudo apt install -y git-all 

# clone the repository.
#curl https://raw.githubusercontent.com/mikecolbert/AzureVM/main/index.html | sudo tee -a /var/www/html/index.html

sudo rm -rf /var/www/html/
sudo rm -rf /var/www/my_portfolio

cd /var/www/

git clone https://github.com/mikecolbert/my_portfolio.git

sudo cp -r /var/www/my_portfolio/ /var/www/html

sudo rm -rf /var/www/html/.github/


