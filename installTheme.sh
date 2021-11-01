#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

apt update
apt install upgrade

# Ensure Gnome Tweaks is installed.
apt install gnome-tweaks -y
apt install gnome-shell-extensions -y

# Install Dep for Avidity themes.
apt-get install gtk2-engines-murrine -y

# Install included Avidity Total Dusk theme.
unzip ./theme.zip -d /usr/share/themes/
# Install included Avidity Total Dusk Reversed icon pack.
unzip ./icons.zip -d /usr/share/icons/
