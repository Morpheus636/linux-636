#!/bin/bash
################################################################################
# You can `source` this file to execute individual functions in it, but you need
# to have your working directory set to the root of the repo.
#
# Functions must NOT be run as sudo to work properly. The script takes no arguments.
#
# Dependencies may be missing if you haven't run the install-apps-sudo script 
# (or setup.sh, which runs it automatically) already on this system, since this
# script depends on programs that were installed by install-apps-sudo Everything 
# works properly when run together in ./setup.sh.

################################################################################
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

install_pop_shell(){
  # Install Pop Shell
  apt-get -qy install node-typescript
  cd $HOME
  git clone https://github.com/morpheus636/pop-shell.git
  cd ./pop-shell # CD into the repo clone
  yes | make local-install
  cd $WORKING_DIR # CD back to the source dir.
}

install_desktop_utils(){
  # Install Morpheus636's Desktop Utils
  mkdir -p $HOME/.local/bin
  cd $HOME
  git clone https://github.com/Morpheus636/desktop-utils.git
  cd ./desktop-utils
  chmod +x ./install.sh
  ./install.sh -d $HOME/.local/bin
  cd $WORKING_DIR
}

install_zeal_cli(){
  # This depends on python and poetry, which are not installed by the install_deps function.
  git clone https://github.com/morpheus636/zeal-cli.git
  cd ./zeal-cli # CD into the repo clone
  git checkout tags/$(git tag --list '[vV]*' --sort=v:refname | tail -1)
  make local-install
}

install_eclipse_java(){
  # Install Eclipse Java to $HOME/eclipse/java/eclipse/eclipse
  mkdir -p $HOME/eclipse/java/
  wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-java-2021-09-R-linux-gtk-x86_64.tar.gz -q -O - | tar -xz -C $HOME/eclipse/java/
  # Symlink Eclipse Java to $HOME/bin/eclipse-java
  mkdir -p $HOME/.local/bin
  ln -s  $HOME/eclipse/java/eclipse/eclipse  $HOME/.local/bin/eclipse-java
  # Copy the .desktop file for eclipse java to add it to the applications menu
  cp ./assets/eclipse/eclipse-java.desktop $HOME/.local/share/applications/eclipse-java.desktop
  sed -i "/s/HOME/$HOME/g" $HOME/.local/share/applications/eclipse-java.desktop
  chmod +x $HOME/.local/share/applications/eclipse-java.desktop
}

install_eclipse_cpp(){
  # Install Eclipse Cpp to $HOME/eclipse/cpp/eclipse/eclipse
  mkdir -p $HOME/eclipse/cpp/
  wget https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2021-09/R/eclipse-cpp-2021-09-R-linux-gtk-x86_64.tar.gz -q -O - | tar -xz -C $HOME/eclipse/cpp/
  # Symlink Eclipse Cpp to $HOME/bin/eclipse-cpp
  mkdir -p $HOME/.local/bin
  ln -s  $HOME/eclipse/cpp/eclipse/eclipse  $HOME/.local/bin/eclipse-cpp
  # Add eclipse cpp to the applicaitons menu
  cp ./assets/eclipse/eclipse-cpp.desktop $HOME/.local/share/applications/eclipse-cpp.desktop
  sed -i "/s/HOME/$HOME/g" $HOME/.local/share/applications/eclipse-cpp.desktop
  chmod +x $HOME/.local/share/applications/eclipse-cpp.desktop
}


main(){
  install_pop_shell
  install_desktop_utils
  install_poetry
  install_zeal_cli
  install_eclipse_java
  install_eclipse_cpp
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi