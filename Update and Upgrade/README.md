<!-- PROJECT SHIELDS -->
![Repo Size](https://img.shields.io/github/repo-size/yourusername/apt-update-script)
![License](https://img.shields.io/github/license/yourusername/apt-update-script)
![Last Commit](https://img.shields.io/github/last-commit/yourusername/apt-update-script)

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
