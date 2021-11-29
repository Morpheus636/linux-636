#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Update System
apt-get update
apt-get install upgrade

# Easy Installations
apt-get install software-properties-common -y
apt-get install apt-transport-https -y
apt-get install wget -y
apt-get install git -y
apt-get install nodejs -y
apt-get install gnome-tweaks -y
apt-get install gnome-shell-extensions -y
snap install pycharm-community --classic
snap install discord
apt-get install vim -y
apt-get install curl -y
apt-get install zeal -y
apt-get install openvpn -y
apt-get install filezilla -y

# Pop Shell
apt-get install node-typescript -y make git
git clone https://github.com/pop-os/shell
cd ./shell # CD into the repo clone
make local-install
cd $scriptpath # CD back to the source dir.

# Add Deadsnakes PPA (For multiple python versions)
add-apt-repository ppa:deadsnakes/ppa
apt-get update

# Install Chrome
add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install google-chrome-stable -y

# Install VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update
apt-get install code -y

# Install Docker and Compose
apt-get install ca-certificates -y
apt-get install gnupg -y
apt-get install lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli conteinerd.io 
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
