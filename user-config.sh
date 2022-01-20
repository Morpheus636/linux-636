#!/bin/bash
################################################################################
# You can `source` this file to execute individual functions in it, but you need
# to have your working directory set to the root of the repo, and you need to
# pass $USER as an arg when you `source` it.

# Functions must be run as sudo to work properly.

# Ensure you run `sudo chown <username> ./home/<username>` after you run functions
# To prevent files in your home directory from being owned by root.
################################################################################
#    © Copyright 2021 Josh Levin (Morpheus636 - https://github.com/morpheus636)
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

setup_fs(){
  # Make repos directories
  mkdir -p $HOMEDIR/src
}

set_wallpaper(){
  # Set wallpaper
  mkdir -p $HOMEDIR/Pictures/wallpaper
  cp ./assets/wallpaper.jpg $HOMEDIR/Pictures/Wallpaper
  gsettings set org.gnome.desktop.background picture-uri "file:///${HOMEDIR}/Pictures/wallpaper/wallpaper.jpg"
}

set_pfp(){
  # Set Profile Picture
  cp ./assets/pfp.png /var/lib/AccountsService/icons/$USERNAME
}

openvpn_config(){
  # OpenVPN Config (if openvpn config file exists in assets/config)
  if [[ -f "./config/client.ovpn" ]]; then
    nmcli connection import type openvpn file ./assets/config/client.ovpn
  fi
}

git_config(){
  # Git configuration
  cp ./assets/config/.gitconfig $HOMEDIR/
}

bash_config(){
  # BASH Configuration
  cp ./assets/config/.bashrc $HOMEDIR
  cp ./assets/config/.bash_aliases $HOMEDIR
}


# TODO - Gnome Tweaks Configuration

# TODO - Install Zeal Docsets

# TODO - Thunderbird Configuration


main(){
  setup_fs
  set_wallpaper
  set_pfp
  openvpn_config
  git_config
  bash_config

  chown $USERNAME $HOMEDIR
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi