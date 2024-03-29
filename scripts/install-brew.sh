#!/bin/bash

if [ -x "$(which brew)" ]; then
  echo "Brew is already installed."
  exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adjust permissions to fix zsh 'insecure completion-dependent directories detected' issue
chmod -R go-w "$(brew --prefix)/share"

