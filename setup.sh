#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Update System
apt update
apt install upgrade

# Easy Installations
apt install software-properties-common -y
apt install apt-transport-https -y
apt install wget -y
apt install git -y
apt install nodejs -y
apt install gnome-tweaks -y
apt install gnome-shell-extensions -y
snap install pycharm-community --classic
snap install discord
apt install vim -y

# Pop Shell
apt install node-typescript -y make git
git clone https://github.com/pop-os/shell
cd ./shell # CD into the repo clone
make local-install
cd $scriptpath # CD back to the source dir.

# Install Theme
./instalTheme.sh

# Add Deadsnakes PPA (For multiple python versions)
add-apt-repository ppa:deadsnakes/ppa
apt update

# Chrome
add-apt-repository "https://github.com/Morpheus636/desktop-config/blob/main/setup.sh"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt update
apt install google-chrome-stable -y

# Install VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install code -y