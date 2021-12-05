#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"
homedir=/home/$1

# Update System
apt-get update
apt-get install upgrade

# Dependencies
apt-get install git -y
apt-get install curl -y
apt-get install software-properties-common -y
apt-get install apt-transport-https -y
apt-get install wget -y

# Easy Apps - Apt
apt-get install nodejs -y
apt-get install gnome-tweaks -y
apt-get install gnome-shell-extensions -y
apt-get install vim -y
apt-get install zeal -y
apt-get install openvpn -y
apt-get install filezilla -y
apt-get install build-essential -y

# Easy Apps - Snap
snap install pycharm-community --classic
snap install discord

# Install Pop Shell
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

# Install Eclipse
# Dependency
apt-get install libcanberra-gtk-module -y
apt-get install default-jdk -y

# Install Eclipse Cpp to $HOMEDIR/eclipse/cpp/eclipse/eclipse
mkdir -p $HOMEDIR/eclipse/cpp/
wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-cpp-2021-09-R-linux-gtk-x86_64.tar.gz -O - | tar -xz -C $HOMEDIR/eclipse/cpp/
# Symlink Eclipse Cpp to $HOMEDIR/bin/eclipse-cpp
ln -s  $HOMEDIR/eclipse/cpp/eclipse/eclipse  $HOMEDIR/.local/bin/eclipse-cpp
# Add eclipse cpp to the applicaitons menu
cp ./deps-assets/eclipse/eclipse-cpp.desktop $HOMEDIR/.local/share/applications/eclipse-cpp.desktop
sed -i "/s/HOMEDIR/$HOMEDIR/g" $HOMEDIR/.local/share/applications/eclipse-cpp.desktop
chmod +x $HOMEDIR/.local/share/applications/eclipse-cpp.desktop

# Install Eclipse Java to $HOMEDIR/eclipse/java/eclipse/eclipse
mkdir -p $HOMEDIR/eclipse/java/
wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-java-2021-09-R-linux-gtk-x86_64.tar.gz -O - | tar -xz -C $HOMEDIR/eclipse/java/
# Symlink Eclipse Java to $HOMEDIR/bin/eclipse-java
ln -s  $HOMEDIR/eclipse/java/eclipse/eclipse  $HOMEDIR/.local/bin/eclipse-java
# Copy the .desktop file for eclipse java to add it to the applications menu
cp ./deps-assets/eclipse/eclipse-java.desktop $HOMEDIR/.local/share/applications/eclipse-java.desktop
sed -i "/s/HOMEDIR/$HOMEDIR/g" $HOMEDIR/.local/share/applications/eclipse-java.desktop
chmod +x $HOMEDIR/.local/share/applications/eclipse-java.desktop
