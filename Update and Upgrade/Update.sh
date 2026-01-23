#!/bin/bash

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