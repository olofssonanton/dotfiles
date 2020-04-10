#!/bin/bash

# sudo management from https://askubuntu.com/a/970898
if ! [ $(id -u) = 0 ]; then
  echo "Need root permissions!"
  exit 1
fi

if [ $SUDO_USER ]; then
  real_user=$SUDO_USER
else
  real_user=$(whoami)
fi

./scripts/apt-install.sh
sudo -u $real_user -i $(pwd)/scripts/install-omz.sh
