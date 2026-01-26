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
