#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"
HOMEDIR=$1

# Make repos directory
mkdir -p $HOMEDIR/Documents/Repos

# BASH Configuration
cp ./config/.bashrc $HOMEDIR
cp ./config/.bash_aliases $HOMEDIR

# Set wallpaper
mkdir -p $HOMEDIR/Pictures/wallpaper
cp ./deps-assets/wallpaper.jpg $HOMEDIR/Pictures/Wallpaper
gsettings set org.gnome.desktop.background picture-uri "file:///${HOMEDIR}/Pictures/Wallpaper/wallpaper.jpg"


# TODO - Gnome Tweaks Configuration

# Git configuration
cp ./config/.gitconfig $HOMEDIR/

# OpenVPN Configuration
if [[ -f "./config/client.ovpn" ]]; then
    nmcli connection import type openvpn file ./config/client.ovpn
fi

# TODO - Install Zeal Docsets

# TODO - Thunderbird Configuration