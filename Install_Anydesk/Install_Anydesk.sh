#!/bin/bash

cat <<'EOF'
                           _           _    
     /\                   | |         | |   
    /  \   _ __  _   _  __| | ___  ___| | __
   / /\ \ | '_ \| | | |/ _` |/ _ \/ __| |/ /
  / ____ \| | | | |_| | (_| |  __/\__ \   < 
 /_/    \_\_| |_|\__, |\__,_|\___||___/_|\_\
                  __/ |                     
                 |___/                      
EOF

set -e

echo -e "============================================"
echo -e "\e[1;34m      - - - - By John Valinsky- - - -\e[0m"
echo -e "============================================"
echo

# Check root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: sudo bash install_anydesk_kali.sh"
  exit 1
fi

echo "Updating system..."
apt update -y

echo "Installing dependencies..."
apt install -y wget gnupg2 ca-certificates apt-transport-https

echo "Adding AnyDesk GPG key..."
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY \
| gpg --dearmor \
| tee /usr/share/keyrings/anydesk.gpg >/dev/null

echo " Adding AnyDesk repository..."
echo "deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" \
| tee /etc/apt/sources.list.d/anydesk.list

echo "Updating package list..."
apt update

echo " Installing AnyDesk..."
apt install -y anydesk

echo " Enabling AnyDesk service..."
systemctl enable anydesk
systemctl start anydesk

echo " Checking AnyDesk service status..."
systemctl status anydesk --no-pager

echo "-----------------------------------"
echo "AnyDesk installed successfully!"
echo "-----------------------------------"

echo " Checking display server..."
SESSION_TYPE=$(echo $XDG_SESSION_TYPE)

if [[ "$SESSION_TYPE" == "wayland" ]]; then
  echo "You are using Wayland."
  echo "    If you get a BLACK SCREEN:"
  echo "    → Log out"
  echo "    → Select 'GNOME on Xorg'"
  echo "    → Log in again"
else
  echo "Xorg detected — good for AnyDesk"
fi

echo
echo " To run AnyDesk:"
echo "    Terminal : anydesk"
echo "    GUI      : Applications → Internet → AnyDesk"
echo
echo "Script completed successfully."
