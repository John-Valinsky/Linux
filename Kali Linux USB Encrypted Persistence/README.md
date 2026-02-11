# Encrypted Persistence Setup Script

A Bash script to create an encrypted persistence partition using LUKS, format it, mount it, and configure persistence.conf automatically. 

This is especially useful for live Linux systems (e.g. Tails-like setups or custom live USB environments) where you want encrypted persistent storage.


# WARNING — READ FIRST

* This script will DESTROY ALL DATA on the selected disk/partition. 

* If you select the wrong device, you will lose data. 

* Only run this if you fully understand what disk you are encrypting.


# What This Script Does