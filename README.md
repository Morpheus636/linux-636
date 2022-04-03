# Desktop Config
A set of configuration files and shell scripts for setting up my desktop OS installations. Written for Ubuntu 20.04 LTS.

You're welcome to use this repo as a starting point for your own install scripts. 

Releases that are not marked as pre-releases should be considered stable, but nothing in this repository comes with any warranty,
implied or otherwise (see the license and copyright notice for more).

# Usage
1. Install Ubuntu 20.04 Desktop. Minimal edition should work fine.
2. Download this repository to somewhere in your user directory. `~/Documents` works well.
3. `cd` into the directory
4. OPTIONAL
    - Place an OpenVPN config file (certs must be included in the file) called `client.ovpn` in the `./assets/config/` directory
    OpenVPN configuration will just be skipped if the file does not exist.
5. `chmod +x ./setup.sh`
6. `sudo ./setup.sh $USER`

To update configuration later on after changes in the git repo, run `sudo ./user-config.sh $USER`.

## Post-Script Manual Configuration
Some changes cannot be made by the script due to limitations of the software involved, or authentication requirements. 

You will need to do the following manually:
- Sign into Chrome. It should sync your config from other devices manually
- Sign into VSCode using your Microsoft account and enable sync.
- Sign into PyCharm with your jetbrains account.
- Sign into Telegram

## Scripts/Modules
### setup.sh
The only script which should be run manually. 

This runs all the other scripts.

It should be run with sudo, and passed a username as the first argument.

# Development Utilities
The `./dev_tools/` directory contains scripts used to streamline development.
None of them should be run by sudo, and they are all documented within themselves. For information on any of them, run `<scriptpath> --help`.

# Apps installed by this script:
## Installed as Sudo
### Using Apt (Non-default repos noted in parenthesis)
- git
- cmake
- curl
- wget
- network-manager
- default-jdk
- gnome-tweaks
- gnome-shell-extensions
- vim
- zeal
- openvpn
- filezilla
- transmission-gtk
- tree
- hexchat
- gimp
- rawtherapee
- libreoffice
- usb-creator-gtk
- virtualbox
- python (deadsnakes/ppa PPA)
    - Python 3.7
    - Python 3.8
    - Python 3.9
    - Python 3.10
- freecad (freecad-maintainers/freecad-stable PPA)
- chrome (google repos)
- vscode (microsoft repos)
- docker (docker repos)
### Using Snap
- PyCharm
- Thunderbird
- Remmina
### Other Install Methods
- NodeJS 16

## Installed as User
- Pop Shell
- Morpheus636's Desktop Utils
- Poetry
- Morpheus636's Zeal CLI
- Eclipse IDE for C/C++ Developers
- Eclipse IDE for Java Developers


# Copyright Notice
© Copyright 2021-2022 Josh Levin ([Morpheus636](https://github.com/morpheus636))

This repository (and everything in it) is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This repository is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this repository.  If not, see <https://www.gnu.org/licenses/>.
