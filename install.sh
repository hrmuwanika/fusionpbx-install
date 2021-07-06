#!/bin/bash

################################################################################
# Script for installing Fusionpbx on Debian Buster
# Authors: Henry Robert Muwanika
#-------------------------------------------------------------------------------
# 
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x install.sh
# Execute the script to install Fusionpbx:
# ./install.sh
################################################################################

#--------------------------------------------------
# Upgrade the packages
#--------------------------------------------------
echo -e "\n============== Update Server ======================="
sudo apt update && sudo apt upgrade -y

#----------------------------------------------------
# Set hostname
#----------------------------------------------------
sudo hostnamectl set-hostname 

#--------------------------------------------------
# Set up the timezones
#--------------------------------------------------
# set the correct timezone on ubuntu
timedatectl set-timezone Africa/Kigali
timedatectl

#----------------------------------------------------
# Disable password authentication
#----------------------------------------------------
sudo sed -i 's/#ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config 
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo service sshd restart

#----------------------------------------------------
# Install Fusionpbx 
#----------------------------------------------------
sudo apt install -y git lsb-release sngrep
sudo apt autoremove -y

cd /usr/src && git clone https://github.com/fusionpbx/fusionpbx-install.sh.git
cd /usr/src/fusionpbx-install.sh/debian && ./install.sh

