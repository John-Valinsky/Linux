<!-- PROJECT SHIELDS -->
![Repo Size](https://img.shields.io/github/repo-size/John-Valinsky/Linux)
![Last Commit](https://img.shields.io/github/last-commit/John-Valinsky/Linux)
![Open Issues](https://img.shields.io/github/issues/John-Valinsky/Linux)
![Stars](https://img.shields.io/github/stars/John-Valinsky/Linux)

# Encrypted Persistence Setup Script

A Bash script to create an encrypted persistence partition using LUKS, format it, mount it, and configure persistence.conf automatically. 

This is especially useful for live Linux systems (e.g. Tails-like setups or custom live USB environments) where you want encrypted persistent storage.


# WARNING — READ FIRST

* This script will DESTROY ALL DATA on the selected disk/partition. 

* If you select the wrong device, you will lose data. 

* Only run this if you fully understand what disk you are encrypting.


# What This Script Does

1  Checks for required system commands.

2  Lists available disks using fdisk.

3  Prompts you to manually choose a disk/partition.

4  Encrypts the partition using LUKS.

5  Opens the encrypted container.

6  Formats it as ext3.

7  Labels it as persistence.

8  Mounts it at /mnt/encData.

9  Creates a persistence.conf file.

10 Configures persistence with / union


# Requirements

The following tools must be installed:

* fdisk

* cryptsetup

* mkfs.ext3

* e2label

* mount

* mkdir

* touch

* vim

* sudo

Most Debian-based systems already include these.


# Usage

1 Make the script executable.
```bash
chmod +x setup-persistence.sh
```

2 Run the script
```bash
./setup-persistence.sh
```

You will be prompted to:

* Review available disks.

* Enter the target disk (e.g. /dev/sda2).

* Set and confirm a LUKS passphrase.

Example Disk Input - /dev/sda2


# Make sure:

* The device exists.

* It is the correct partition.

* You are okay with it being fully wiped and encrypted.


# Result

The encrypted device is mapped as
```bash
/dev/mapper/encData
```
Mounted at
```bash
/mnt/encData
```

Contains
```bash
persistence.conf
```

Persistence configuration
```bash
/ union
```

# Use Cases

* Encrypted persistence for live Linux USBs.

* Secure storage partitions.

* Privacy-focused environments.

* Testing LUKS automation workflows.


# Notes

* The script uses ext3 for compatibility with persistence systems.

* The mapper name is hardcoded as encData.

* The mount point is /mnt/encData.


# License

MIT License

Copyright (c) 2026 John Valinsky

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files, to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.