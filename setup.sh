#!/bin/bash

scriptpath="$(dirname $(readlink -f $0))/$(basename $0)"

# Run install apps
./install-apps.sh

# Run install theme
./install-theme.sh

