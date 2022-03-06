#!/bin/bash
################################################################################
# You can `source` this file to execute individual functions in it, but you need
# to have your working directory set to the root of the repo.

# Dependencies may be missing if you haven't run this script (or setup.sh, which
# runs this script automatically) already on this system. Run the install_deps
# function from install-apps.sh before running any other functions to prevent this.

# Functions must NOT be run as sudo.
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

setup_fs(){
  # Make repos directories
  mkdir -p $HOME/src
}

set_wallpaper(){
  # Set wallpaper
  rm -f $HOME/Pictures/wallpaper/wallpaper.jpg
  mkdir -p $HOME/Pictures/wallpaper
  cp ./assets/wallpaper.jpg $HOME/Pictures/wallpaper/
  gsettings set org.gnome.desktop.background picture-uri "file:///${HOME}/Pictures/wallpaper/wallpaper.jpg"
}

set_pfp(){
  # Set Profile Picture
  cp ./assets/pfp.png /var/lib/AccountsService/icons/$USER
  #TODO make sure icon= in /var/lib/AccountsService/users/$USER is set to /var/lib/AccountsService/icons/$USER and not /home/$USER/.face
}

openvpn_config(){
  # OpenVPN Config (if openvpn config file exists in assets/config)
  if [[ -f "./config/client.ovpn" ]]; then
    nmcli connection import type openvpn file ./assets/config/client.ovpn
  fi
}

setup_ssh(){
  yes "" | ssh-keygen -t rsa
}

git_config(){
  # Git configuration
  cp ./assets/config/.gitconfig $HOME/
}

bash_config(){
  # BASH Configuration
  cp ./assets/config/.bashrc $HOME
  cp ./assets/config/.bash_aliases $HOME
}

gnome_config(){
  # Gnome and Gnome Tweaks Configuration
  # TODO - Most of the config.
  #gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
}

install_zeal_docsets(){
  # Install Zeal Docsets
  zeal-cli install C++ CMake CSS Django JavaScript Python3 React
}

# TODO - Thunderbird Configuration


main(){
  setup_fs
  set_wallpaper
  set_pfp
  openvpn_config
  setup_ssh
  git_config
  bash_config
  gnome_config
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"

