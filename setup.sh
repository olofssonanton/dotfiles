#!/bin/bash

for argument in "$@"
do
  if [ "$argument" == "--no-gui" ];
  then
    echo "Will not install GUI-related programs."
    export NO_GUI="true"
  fi
done

echo Setting up symlinks
./scripts/setup-dotfile-symlinks.sh

echo Installing programs
sudo NO_GUI="$NO_GUI" ./scripts/installations.sh
