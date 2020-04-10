#!/bin/bash

if [[ -d "$ZSH" ]]; then
  echo Oh My Zsh is already installed.
  exit 0
fi

filename=omz-install.sh
filepath=$(pwd)/$filename

echo

if [[ -f "${dest}" ]]; then
  echo Using existing installation file located at $filepath
else
  echo Downloading Oh My Zsh installation file into $filepath...
  curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output $filepath --silent --fail
fi

if ! [[ $? -eq 0 ]]; then
  echo Failed to download Oh My Zsh installation file.
  exit 1
fi

read -p "Have you inspected the downloaded file, and wish to continue with the installation? (y/N) " -n 1 -r
echo
if ! [[ "$REPLY" =~ ^[Yy]$ ]]; then
  echo Removing installation file.
  rm $filepath
  exit 1
fi

echo -e "Proceeding with installation.\n"
sh $filename --keep-zshrc

if ! [[ $? -eq 0 ]]; then
  echo Installation failed. Leaving installation file for the next try.
  exit 1
fi

echo Installation finished, removing the installation file.
rm $filepath
