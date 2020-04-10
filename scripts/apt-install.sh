#!/bin/bash

# Stolen from https://github.com/tomnomnom/dotfiles/
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    apt-get install $1
  else
    echo "Already installed: ${1}"
  fi
}

install tmux
install awesome
install unclutter # Change EXTRA_OPTS in /etc/default/unclutter to "-idle 2 -noevents"
install zsh
