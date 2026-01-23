Interactive APT Update & Upgrade Script

A simple interactive Bash script for Debian-based Linux systems (Ubuntu, Linux Mint, etc.) that:

Updates package lists

Shows upgradeable packages (optional)

Performs a full system upgrade (optional)

Cleans up unused packages


Features

* Runs apt-get update and apt update

* Option to list upgradeable packages

* Option to perform a full upgrade

* Automatically cleans unused packages

* User-friendly interactive prompts


Script

#!/bin/bash

sudo apt-get update 
sudo apt update

echo -e "\n\nList Upgradeables? (y/n)"
read -p "> " q  # Adds a prompt character for user input

if [ "$q" = 'y' ]; then
    apt list --upgradeable
else
    echo -e "\n\nHave a nice day"
fi

echo -e "\nDo you want to Upgrade? (y/n)"
read -p "> " q2  # Adds a prompt character for user input

if [ "$q2" = 'y' ]; then
    sudo apt full-upgrade -y
    sudo apt autoclean
    sudo apt autoremove
else
    echo -e "\nNo Upgrade for now!"
fi


Requirements

* Debian-based Linux distribution.

* apt and apt-get

* Sudo privileges