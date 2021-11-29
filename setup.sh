#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Run install apps
chmod +x ./install-apps.sh
./install-apps.sh

# Run install theme
chmod +x ./install-theme.sh
./install-theme.sh
