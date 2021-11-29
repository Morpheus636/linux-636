# Desktop Config
A set of configuration files (dotfiles) and shell scripts for setting up my desktop OS installations. Written for Ubuntu 20.04 LTS.

You're welcome to use this repo as a starting point for your own install scripts.

# install-apps.sh
Installs the following. It also installs other dependencies (both explicitly and implicitly)
which may not be listed here.
## Apps
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
## PPAs
- `ppa:deadsnakes/ppa`


# install-theme.sh
Installs the following themes and icon packs.
- Avidity Total Dusk Theme (Included locally in Repo)
- Avidity Total Dusk Suru Icon Pack (Reversed)

# user-config
- Creates a `Repos` directory within `~/Documents/`
- Configures an OpenVPN client connection (place an openvpn config file in this directory after git cloning)