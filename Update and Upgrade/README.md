🛠️ Interactive APT Update & Upgrade Script

A simple interactive Bash script for Debian-based Linux systems (Ubuntu, Linux Mint, Pop!_OS, etc.) that helps you:

Update package lists

View upgradeable packages

Perform a full system upgrade

Clean unused packages

📌 Features

🔄 Runs apt-get update and apt update

📋 Option to list upgradeable packages

🚀 Option to perform a full upgrade

🧹 Automatically cleans unused packages

🤝 User-friendly interactive prompts

📜 Script
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

⚙️ Requirements

Debian-based Linux distribution (Ubuntu, Linux Mint, Pop!_OS, etc.)

apt and apt-get

Sudo privileges

🚀 Installation
Option 1: Clone the Repository
git clone https://github.com/yourusername/apt-update-script.git
cd apt-update-script

Option 2: Create the Script Manually
nano update.sh


Paste the script content and save.

▶️ Usage

Make the script executable:

chmod +x update.sh


Run the script:

./update.sh

🧠 How It Works

Updates the package list using:

apt-get update

apt update

Prompts:

List upgradeable packages?

If y: shows all upgradeable packages

Else: skips listing

Prompts:

Do you want to upgrade?

If y: performs:

apt full-upgrade -y

apt autoclean

apt autoremove

Else: exits

🔐 Notes

Requires sudo access for updates and upgrades.

Safe for routine system maintenance.

Best run when no critical applications are active.

Can be scheduled with cron for automation.

⏰ (Optional) Run Automatically with Cron

Edit your crontab:

crontab -e


Add a line (example: run every Sunday at 3 AM):

0 3 * * 0 /path/to/update.sh >> /path/to/update.log 2>&1