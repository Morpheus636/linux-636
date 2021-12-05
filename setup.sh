#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"
USERNAME=$1
HOMEDIR=/home/$1

# Run install apps
chmod +x ./install-apps.sh
./install-apps.sh $HOMEDIR

# Run install theme 
chmod +x ./install-theme.sh
./install-theme.sh

# Run user config
chmod +x ./user-config.sh
./user-config.sh $HOMEDIR

# Ensure everything in the user's homedir is owned by the user.
chown -R $USERNAME $HOMEDIR