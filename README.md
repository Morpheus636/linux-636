# Desktop Config
A set of configuration files (dotfiles) and shell scripts for setting up my desktop OS installations. Written for Ubuntu 20.04 LTS.

You're welcome to use this repo as a starting point for your own install scripts.

# Usage
__WARNING__ Only `setup.sh` should be run on it's own,. 
Other scripts in this directory are run automatically by `setup.sh` and could cause problems if manually run.

1. Install Ubuntu 20.04 Desktop. Minimal edition should work fine.
2. Download this repository to somewhere in your user directory. `~/Documents` works well.
3. `cd` into the directory
4. OPTIONAL - Place an OpenVPN config file (certs must be included in the file) called `client.ovpn` in the `config` directory
    OpenVPN configuration will just be skipped if the file does not exist.
5. `chmod +x ./setup.sh`
6. `sudo ./setup.sh $USER`

## Post-Script Manual Configuration
Some changes cannot be made by the script due to limitations of the software involved, or authentication requirements. 

You will need to do the following manually:
- Sign into Chrome. It should sync your config from other devices manually
- Sign into VSCode using your Microsoft account and enable sync.
- Sign into PyCharm with your jetbrains account.

# Scripts
## setup.sh
The only script which should be run manually. 

This runs all the other scripts.

It should be run with sudo, and passed a username as the first argument.

## install-apps.sh
Installs the following. It also installs other dependencies (both explicitly and implicitly through apt)
which may not be listed here.
### Apps
- Git
- NodeJS
- Gnome Tweaks
- Gnome Shell Extensions
- Node Typescript
- Pop Shell
- Chrome
- VSCode
- Pycharm CE
- Discord
- Docker
- Docker Compose
- Filezilla
- OpenVPN
### PPAs
- `ppa:deadsnakes/ppa`


## install-theme.sh
Installs the following themes and icon packs.
- Avidity Total Dusk Theme (Included locally in Repo)
- Avidity Total Dusk Suru Icon Pack (Reversed)

## user-config.sh
- Creates a `Repos` directory within `~/Documents/`
- Configures an OpenVPN client connection (place an openvpn config file in this directory after git cloning)