#!/bin/bash

# Git clone 
git clone https://github.com/verma-kunal/nodejs-mysql.git /home/ubuntu/terraform-project
cd /home/ubuntu/terraform-project

# install nodejs
sudo apt update -y
sudo apt install -y nodejs npm

# edit env vars
echo "DB_HOST=terraform-rds.cr0a6ss0ytoq.ap-south-1.rds.amazonaws.com" | sudo tee .env
echo "DB_USER=admin" | sudo tee -a .env
sudo echo "DB_PASS=admin123" | sudo tee -a .env
echo "DB_NAME=terraform_db" | sudo tee -a .env
echo "TABLE_NAME=users" | sudo tee -a .env
echo "PORT=3000" | sudo tee -a .env

# install dependencies
npm install

# start server
npm start