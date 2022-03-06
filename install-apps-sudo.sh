#!/bin/bash
################################################################################
# You can `source` this file to execute individual functions in it, but you need
# to have your working directory set to the root of the repo, and you need to
# pass $USER as an arg when you `source` it. Everything must be run as root to
# work properly.

# Dependencies may be missing if you haven't run this script (or setup.sh, which
# runs this script automatically) already on this system.
# Run the install_deps function to prevent this.
# Everything works when run together in ./setup.sh or just by directly running this
# script.

# Ensure you run `sudo chown -R /home/<username> <username>` after you run this
# to prevent files in your home directory from being owned by root.
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
  apt-get -qy install make
  apt-get -qy install curl 
  apt-get -qy install software-properties-common 
  apt-get -qy install apt-transport-https 
  apt-get -qy install wget 
  apt-get -qy install network-manager 
  apt-get -qy install libcanberra-gtk-module 
  apt-get -qy install default-jdk 
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
  apt-get -qy install gimp
  apt-get -qy install rawtherapee 
  apt-get -qy install libreoffice
  apt-get -qy install usb-creator-gtk
}


install_snaps(){
  # Easy Apps - Snap
  snap install pycharm-community --classic
  snap install thunderbird
  snap install remmina
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


install_python(){
  apt-get -qy install python3.7
  apt-get -qy install python3.8
  apt-get -qy install python3.9
  apt-get -qy install python3.10
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


# TODO - Install Git lfs

# TODO - Install Discord


main(){
  install_deps
  install_apts
  install_snaps
  add_ppas
  install_node
  install_python
  install_freecad
  install_chrome
  install_vscode
  install_docker
  chown -R $USERNAME $HOMEDIR
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi