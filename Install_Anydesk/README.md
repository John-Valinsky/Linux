# AnyDesk Installer for Kali Linux

A simple automated Bash script to install and configure AnyDesk on Kali Linux safely and correctly.

This script:

* Updates the system

* Installs required dependencies

* Adds the official AnyDesk GPG key

* Adds the AnyDesk repository

* Installs AnyDesk

* Enables and starts the AnyDesk service

* Detects Wayland/Xorg session issues


# Features

* Fully automated installation

* Uses official AnyDesk repository

* Enables system service automatically

* Checks service status

* Detects Wayland compatibility issues

* Safe error handling using set -e


# Requirements

* Kali Linux

* Root or sudo privileges

* Internet connection


# Installation

### Clone the repository
```bash
git clone https://github.com/John-Valinsky/Linux/
```
### Change directory
```bash
cd Install_Anydesk
```
### Give execute permission
```bash
chmod +x Install_Anydesk
```
### Run the script
```bash
sudo ./Install_Anydesk
```
### Script
```bash
#!/bin/bash

set -e

echo "==============================="
echo " AnyDesk Installer for Kali "
echo "==============================="

# Check root
if [[ "$EUID" -ne 0 ]]; then
  echo "[!] Please run as root: sudo bash install_anydesk_kali.sh"
  exit 1
fi

echo "[+] Updating system..."
apt update -y

echo "[+] Installing dependencies..."
apt install -y wget gnupg2 ca-certificates apt-transport-https

echo "[+] Adding AnyDesk GPG key..."
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY \
| gpg --dearmor \
| tee /usr/share/keyrings/anydesk.gpg >/dev/null

echo "[+] Adding AnyDesk repository..."
echo "deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" \
| tee /etc/apt/sources.list.d/anydesk.list

echo "[+] Updating package list..."
apt update

echo "[+] Installing AnyDesk..."
apt install -y anydesk

echo "[+] Enabling AnyDesk service..."
systemctl enable anydesk
systemctl start anydesk

echo "[+] Checking AnyDesk service status..."
systemctl status anydesk --no-pager

echo "-----------------------------------"
echo "[✓] AnyDesk installed successfully!"
echo "-----------------------------------"

echo "[+] Checking display server..."
SESSION_TYPE=$(echo $XDG_SESSION_TYPE)

if [[ "$SESSION_TYPE" == "wayland" ]]; then
  echo "[!] You are using Wayland."
  echo "    If you get a BLACK SCREEN:"
  echo "    → Log out"
  echo "    → Select 'GNOME on Xorg'"
  echo "    → Log in again"
else
  echo "[✓] Xorg detected — good for AnyDesk"
fi

echo
echo "[+] To run AnyDesk:"
echo "    Terminal : anydesk"
echo "    GUI      : Applications → Internet → AnyDesk"
echo
echo "[✓] Script completed successfully."
```