#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Update System
apt update -y
apt upgrade -y

# Install Simple Apt Packages
apt install git -y
apt install nodejs -y
apt install gnome-tweaks -y
apt install gnome-shell-extensions -y

# Install Pop Shell
apt install node-typescript -y make git
git clone https://github.com/pop-os/shell
cd ./shell # CD into the 
make local-install
cd $scriptpath # CD back to the source dir.

# Install Avidity Total Dusk Theme
apt-get install gtk2-engines-murrine
mv ./Avidity-Total-Dusk-3.36 /usr/share/themes/Avidity-Total-Dusk-3.36
# Install Avidity Total Dusk Icon Pack


# Add Deadsnakes PPA (For multiple python versions)
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Install VSCode
apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt install code

# Install Pycharm CE
snap install pycharm-community --classic