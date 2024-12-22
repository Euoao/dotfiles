#!/bin/bash

sudo apt update


echo "Installing bat..."
sudo apt install bat
if [ -f /usr/bin/batcat ] && [ ! -f /usr/local/bin/bat ]; then
    echo "Creating symbolic link from /usr/bin/batcat to /usr/local/bin/bat"
    sudo ln -s /usr/bin/batcat /usr/local/bin/bat
fi


echo "Installing eza..."
sudo apt install eza


echo "Installing fd..."
sudo apt install fd-find
if [ -f /usr/bin/fdfind ] && [ ! -f /usr/local/bin/fd ]; then
    echo "Creating symbolic link from /usr/bin/fdfind to /usr/local/bin/fd"
    sudo ln -s /usr/bin/fdfind /usr/local/bin/fd
fi

echo "Installing rg..."
sudo apt install ripgrep

