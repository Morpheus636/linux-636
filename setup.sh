#!/bin/bash
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

SCRIPTPATH="$(dirname $(dirname $(readlink -f $0))/$(basename $0))"
USERNAME=$1
HOMEDIR=/home/$1

# Run install apps
chmod +x ./install-apps.sh
./install-apps.sh $USERNAME

# Run install theme 
chmod +x ./install-theme.sh
./install-theme.sh

# Run user config
chmod +x ./user-config.sh
sudo -u $USER ./user-config.sh $USERNAME

# Ensure everything in the user's homedir is owned by the user.
chown -R $USERNAME $HOMEDIR