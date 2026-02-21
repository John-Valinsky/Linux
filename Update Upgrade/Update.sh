#!/bin/bash

echo -e "\e[1;32m"
echo "  _   _ ____  ____    _  _____ _____ "
echo " | | | |  _ \\|  _ \\  / \\|_   _| ____|"
echo " | | | | |_) | | | |/ _ \\ | | |  _|  "
echo " | |_| |  __/| |_| / ___ \\| | | |___ "
echo "  \\___/|_|   |____/_/   \\_\\_| |_____|"
echo -e "\e[0m"
echo -e "========================================"
echo -e "\e[1;34m    - - - - By John Valinsky - - - -\e[0m"
echo -e "========================================"
echo

sudo apt-get update 
sudo apt update

echo -e "\n\nList Upgradeables? (y/n)"
read -p "> " q

if [ "$q" = 'y' ]; then
    apt list --upgradeable
else
    echo -e "\n\nHave a nice day"
fi

echo -e "\nDo you want to Upgrade? (y/n)"
read -p "> " q2

if [ "$q2" = 'y' ]; then
    sudo apt full-upgrade -y
    sudo apt autoclean
    sudo apt autoremove
else
    echo -e "\nNo Upgrade for now!"
fi
