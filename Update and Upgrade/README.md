<!-- PROJECT SHIELDS -->
![Repo Size](https://img.shields.io/github/repo-size/John-Valinsky/Linux)
![License](https://img.shields.io/github/license/John-Valinsky/Linux)
![Last Commit](https://img.shields.io/github/last-commit/John-Valinsky/Linux)
![Open Issues](https://img.shields.io/github/issues/John-Valinsky/Linux)
![Stars](https://img.shields.io/github/stars/John-Valinsky/Linux)


# APT Update & Upgrade Interactive Script

A **simple interactive Bash script** for Debian-based Linux distributions (Ubuntu, Linux Mint, Pop!\_OS, etc.) that allows you to:

-  Update package lists  
-  List upgradeable packages (optional)  
-  Perform a full system upgrade (optional)  
-  Clean unused packages  

---

## Features

- Updates package lists using `apt-get update` and `apt update`  
- Optionally lists upgradeable packages  
- Optionally performs full upgrade, autoclean, and autoremove  
- Interactive prompts for user-friendly experience  

---

## Requirements

- Debian-based Linux distribution (Ubuntu, Linux Mint, Pop!\_OS, etc.)  
- `apt` and `sudo` privileges  

---

## Installation

### Clone the Repository

```bash
git clone https://github.com/yourusername/apt-update-script.git
cd apt-update-script
```
Or Create Script Manually

```bash
nano update.sh
```
## Script
```bash
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
```