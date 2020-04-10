#!/bin/bash

echo Setting up symlinks
./scripts/setup-dotfile-symlinks.sh

echo Installing programs
sudo ./scripts/installations.sh
