#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Update System
apt-get update
apt-get install upgrade

# Dependencies
apt-get install git -y
apt-get install curl -y
apt-get install software-properties-common -y
apt-get install apt-transport-https -y
apt-get install wget -y

# Easy Apps
apt-get install nodejs -y
apt-get install gnome-tweaks -y
apt-get install gnome-shell-extensions -y
snap install pycharm-community --classic
snap install discord
apt-get install vim -y
apt-get install zeal -y
apt-get install openvpn -y
apt-get install filezilla -y
apt-get install build-essential -y

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


# Install Eclipse
# Dependency
apt-get install default-jre -y

# Install Eclipse Cpp to ~/eclipse/cpp/eclipse/eclipse
wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/SR2/eclipse-cpp-kepler-SR2-linux-gtk-x86_64.tar.gz -O ./eclipse-cpp.tar.gz
mkdir -p ~/eclipse/cpp/
tar -xf ./eclipse-cpp.tar.gz -C ~/eclipse/cpp/
# Symlink Eclipse Cpp to ~/bin/eclipse-cpp
ln -s  ~/eclipse/cpp/eclipse/eclipse  ~/bin/eclipse-cpp
# Delete the eclipsd cpp tarball
rm -rf ./eclipse-cpp.tar.gz

# Install Eclipse Java to ~/eclipse/java/eclipse/eclipse
wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2021-09/R/eclipse-java-2021-09-R-linux-gtk-x86_64.tar.gz -O ./eclipse-java.tar.gz
mkdir -p ~/eclipse/java/
tar -xf ./eclipse-java.tar.gz -C ~/eclipse/java/
# Symlink Eclipse Java to ~/bin/eclipse-java
ln -s  ~/eclipse/java/eclipse/eclipse  ~/bin/eclipse-java
# Delete the eclipsd Java tarball
rm -rf ./eclipse-java.tar.gz
