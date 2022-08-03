#!/bin/bash
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

help() {
   # Display Help
   echo "Config-Grabber development tool for desktop-config by Morpheus636."
   echo
   echo "Gets configuration from various sources and stores it in a way that"
   echo "other scripts in this repo can understand."
   echo
   echo "Have your working directory set to the root of this repository."
   echo "Do not run using sudo."
   echo
   echo "Syntax: /path/to/grab_config.sh [-g|b|h]"
   echo "Options:"
   echo "none:  Get all supported config files."
   echo "-g     Get only git config files."
   echo "-b     Get only BASH config files."
   echo "-v     Get only Vim config files."
   echo "-h     Print this Help message."
   echo 
   exit 0
}

get_git_config() {
  echo "Getting Git Configuration."
  # Get the Git Configuration file.
  cp $HOME/.gitconfig ./assets/config/
}

get_bash_config() {
  echo "Getting BASH configuration"
  # Get the .bashrc and .bash_aliases file
  cp $HOME/.bashrc ./assets/config/
  cp $HOME/.bash_aliases ./assets/config/
}

get_vim_config() {
  echo "Getting Vim Configuration"
  # Get the .vimrc file
  cp $HOME/.vimrc ./assets/config/
}

main() {
  get_git_config
  get_bash_config
  get_vim_config
}

# Process the input options.
while getopts "gbh:" option; do
  case ${option} in
    g ) # -g: Get Git config files
      get_git_config
      exit 0
      ;;
    b ) # -g: Get BASH config files
      get_bash_config
      exit 0
      ;;
    v ) # -v: Get Vim config files
      get_vim_config
      exit 0
      ;;
    h ) # -h: Display Help
      help
      exit 0
      ;;
    \? ) # Invalid Option, Display Help
      help
      exit 1
      ;;
  esac
done

main
