#!/bin/bash

# sudo management from https://askubuntu.com/a/970898
if ! [ $(id -u) = 0 ]; then
  echo Need root permissions!
  exit 1
fi

if [ $SUDO_USER ]; then
  real_user=$SUDO_USER
else
  real_user=$(whoami)
fi

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*)
  ./scripts/apt-install.sh
  ;;
Darwin*)
   sudo -u $real_user -i $(pwd)/scripts/install-brew.sh
  ;;
esac


function getUserShell() {
  case "${unameOut}" in
  Linux*)
    getent passwd $real_user | cut -d: -f7
    ;;
  Darwin*)
    dscl . -read /Users/$real_user UserShell | sed 's/UserShell: //'
    ;;
  esac

}

user_shell=$(getUserShell)
zsh_path=$(which zsh)
if ! [[ $user_shell = $zsh_path ]]; then
  read -p "$zsh_path has not been selected as the default shell for $real_user (currently $user_shell). Do you want to do that now? (Y/n) " -n 1 -r
  echo
  if ! [[ "$REPLY" =~ ^[Nn]$ ]]; then
    echo Changing shell to $zsh_path for user $real_user.
    chsh -s $(which zsh) $real_user
  fi

fi

if [[ $(getUserShell) = $zsh_path ]]; then
  sudo -u $real_user -i $(pwd)/scripts/install-omz.sh
else
  echo Not proceeding with Oh My Zsh installation as zsh is not selected as the default shell.
fi
