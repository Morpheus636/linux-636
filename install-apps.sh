#!/bin/bash
################################################################################
# You can `source` this file to execute individual functions in it, but you need
# to have your working directory set to the root of the repo, and you need to
# pass $USER as an arg when you `source` it.

# Dependencies may be missing if you haven't run this script (or setup.sh, which
# runs this script automatically) already on this system.
# run the install_deps function before running any other functions to prevent this
# (although there might still be deps for certain functions that don't get installed
# by this function since this isn't really a supported use case.
# Everything works when run together in ./setup.sh or just by directly running this
# script.)

# Functions must be run as sudo to work properly.

# Ensure you run `sudo chown -R /home/<username> <username>` after you run functions
# To prevent files in your home directory from being owned by root.
################################################################################
#    © Copyright 2021-2022 Josh Levin (Morpheus636 - https://github.com/morpheus636)
# 
#    This file is part of Morpheus636's desktop-config repository.
#
#    This repository (and everything in it) is free software: 
#    you can redistribute it and/or modify it under the terms 
#    of the GNU General Public License as published by the 
#    Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This repository is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this repository.  If not, see <https://www.gnu.org/licenses/>.

WORKING_DIR=$PWD
USERNAME=$1
HOMEDIR=/home/$1

if [ $# -eq 0 ]
  then
    echo "You must pass \$USER as the only arg."
    exit 1
fi

install_deps(){
  apt-get update
  apt-get -qy upgrade 
  # Dependencies
  apt-get -qy install git 
  apt-get -qy install curl 
  apt-get -qy install software-properties-common 
  apt-get -qy install apt-transport-https 
  apt-get -qy install wget 
  apt-get -qy install network-manager 
}


install_apts(){
  # Easy Apps - Apt
  apt-get -qy install gnome-tweaks 
  apt-get -qy install gnome-shell-extensions 
  apt-get -qy install vim 
  apt-get -qy install zeal 
  apt-get -qy install openvpn 
  apt-get -qy install filezilla 
  apt-get -qy install build-essential 
  apt-get -qy install transmission-gtk 
  apt-get -qy install tree 
  apt-get -qy install hexchat 
  apt-get -qyinstall gimp
  apt-get -qy install rawtherapee 
}


install_snaps(){
  # Easy Apps - Snap
  snap install pycharm-community --classic
  snap install discord # FIXME - Install from .deb?
  snap install thunderbird
  snap install libreoffice
}


install_pop_shell(){
  # Install Pop Shell
  apt-get -qy install node-typescript make git
  cd $HOMEDIR
  git clone https://github.com/pop-os/shell
  cd ./shell # CD into the repo clone
  yes | make local-install
  cd $WORKING_DIR # CD back to the source dir.
}


install_desktop_utils(){
  # Install Morpheus636's Desktop Utils
  mkdir -p $HOMEDIR/.local/bin
  cd $HOMEDIR
  git clone https://github.com/Morpheus636/desktop-utils.git
  cd ./desktop-utils
  chmod +x ./install.sh
  ./install.sh -d $HOMEDIR/.loal/bin
  cd $WORKING_DIR
}

add_ppas(){
  # Add Deadsnakes PPA (For multiple python versions)
  add-apt-repository ppa:deadsnakes/ppa -y

}

install_node(){
  # Install NodeJS 16
  curl -sL https://deb.nodesource.com/setup_16.x | bash -
  apt-get -qy install nodejs

}

install_freecad(){
  # Install FreeCAD
  add-apt-repository ppa:freecad-maintainers/freecad-stable -y
  apt-get update
  apt-get -qy install freecad 
  apt-get -qy upgrade 
}

install_chrome(){
  # Install Chrome
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
  add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main" -y
  apt-get update
  apt-get -qy install google-chrome-stable
}

install_vscode(){
  # Install VSCode
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
  add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
  apt-get update
  apt-get -qy install code 
}

install_docker(){
  # Install Docker and Compose
  apt-get -qy install ca-certificates 
  apt-get -qy install gnupg 
  apt-get -qy install lsb-release 
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get update
  apt-get -qy install docker-ce docker-ce-cli conteinerd.io 
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

install_eclipse_java(){
  # Dependency
  apt-get -qy install libcanberra-gtk-module 
  apt-get -qy install default-jdk 

  mkdir -p $HOMEDIR/.local/bin
  
  # Install Eclipse Java to $HOMEDIR/eclipse/java/eclipse/eclipse
  mkdir -p $HOMEDIR/eclipse/java/
  wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-java-2021-09-R-linux-gtk-x86_64.tar.gz -O - | tar -xz -C $HOMEDIR/eclipse/java/
  # Symlink Eclipse Java to $HOMEDIR/bin/eclipse-java
  ln -s  $HOMEDIR/eclipse/java/eclipse/eclipse  $HOMEDIR/.local/bin/eclipse-java
  # Copy the .desktop file for eclipse java to add it to the applications menu
  cp ./assets/eclipse/eclipse-java.desktop $HOMEDIR/.local/share/applications/eclipse-java.desktop
  sed -i "/s/HOMEDIR/$HOMEDIR/g" $HOMEDIR/.local/share/applications/eclipse-java.desktop
  chmod +x $HOMEDIR/.local/share/applications/eclipse-java.desktop
}

install_eclipse_cpp(){
  # Dependency
  apt-get -qy install libcanberra-gtk-module 
  apt-get -qy install default-jdk 

  mkdir -p $HOMEDIR/.local/bin

  # Install Eclipse Cpp to $HOMEDIR/eclipse/cpp/eclipse/eclipse
  mkdir -p $HOMEDIR/eclipse/cpp/
  wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-cpp-2021-09-R-linux-gtk-x86_64.tar.gz -O - | tar -xz -C $HOMEDIR/eclipse/cpp/
  # Symlink Eclipse Cpp to $HOMEDIR/bin/eclipse-cpp
  ln -s  $HOMEDIR/eclipse/cpp/eclipse/eclipse  $HOMEDIR/.local/bin/eclipse-cpp
  # Add eclipse cpp to the applicaitons menu
  cp ./assets/eclipse/eclipse-cpp.desktop $HOMEDIR/.local/share/applications/eclipse-cpp.desktop
  sed -i "/s/HOMEDIR/$HOMEDIR/g" $HOMEDIR/.local/share/applications/eclipse-cpp.desktop
  chmod +x $HOMEDIR/.local/share/applications/eclipse-cpp.desktop
}


# TODO - Install Git lfs

# TODO - Install RawTherapee

# TODO - Install GIMP

main(){
  install_apts
  install_snaps
  install_pop_shell
  install_desktop_utils
  add_ppas
  install_node
  install_freecad
  install_chrome
  install_vscode
  install_docker
  install_eclipse_java
  install_eclipse_cpp
  chown -R $USERNAME $HOMEDIR
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi