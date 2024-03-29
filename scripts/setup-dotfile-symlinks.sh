#!/bin/bash

# Stolen from https://github.com/tomnomnom/dotfiles/

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .zshenv
linkDotfile .zshrc
linkDotfile .gitconfig
linkDotfile .gitignore
linkDotfile .tmux.conf

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*)
  linkDotfile .xinitrc
  linkDotfile .xsession
  linkDotfile .config/awesome
  ;;
esac
