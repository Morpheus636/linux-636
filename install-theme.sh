#!/bin/bash
################################################################################
# This script must be run as sudo, with the working dir set as the root
# of the repo. It takes no arguments.

# Ensure you run `sudo chown ./home/<username> <username>` after you run functions
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

apt-get update -y
apt-get install upgrade -y

# Ensure Gnome Tweaks is installed.
apt-get install gnome-tweaks -y
apt-get install gnome-shell-extensions -y

# Install Dep for Avidity themes.
apt-get install gtk2-engines-murrine -y

# Install included Avidity Total Dusk theme.
unzip ./assets/theme.zip -d /usr/share/themes/
# Install included Avidity Total Dusk Reversed icon pack.
unzip ./assets/icons.zip -d /usr/share/icons/

# TODO - Set Avidty to active theme and icon pack.