#!/bin/bash
# Please edit --gamma to your preference below.
# This script is for flatpack steam game install locations. Execute it as your regular user account.
# Install xrandr via distro package manager.
# Check if the system is running a Debian-based distribution.
if ! command -v xrandr &> /dev/null; then
    echo "xrandr is not installed. Installing it..."

    if [[ -f /etc/debian_version ]]; then
        # Install xrandr using the apt package manager (for Debian/Ubuntu).
        sudo apt update
        sudo apt install xrandr

    # Check if the system is running a Red Hat-based distribution.
    elif [[ -f /etc/redhat-release ]]; then
        # Install xrandr using the yum package manager (for CentOS/Fedora).
        sudo dnf install xrandr

    # Check if the system is running an Arch-based distribution.
    elif [[ -f /etc/arch-release ]]; then
        # Install xrandr using the pacman package manager (for Arch Linux).
        sudo pacman -S xorg-xrandr

    # If the distribution is not recognized.
    else
        echo "Unsupported distribution. Please install xrandr manually."
    fi
else
    echo "xrandr is already installed."
fi

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Define the user with directory path and gamma script names.
echo "Enter a desktop gamma setting (e.g. '1.00:1.00:1.00') Press Enter to use this setting."
read -p "Desktop Gamma: " d_gamma

echo "Enter your application gamma setting (e.g. '1.20:1.20:1.20'). Press Enter to use this setting."
read -p "Application Gamma: " a_gamma

if [[ -z "$d_gamma" && -z "$a_gamma" ]]; then
    # Use default gamma settings
    d_gamma="1.00:1.00:1.00"
    a_gamma="1.20:1.20:1.20"
fi

active_output=$(xrandr --query | awk '/ connected/ && / primary/ {print $1}')
steam_fp="$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/"
steam_native="$HOME/.local/share/Steam/steamapps/common/"

if [[ -d "${steam_fp}" ]]; then
    echo "Flatpack Steam is used."
    script_directory="${steam_fp}scripts/"
else
    echo "Flatpack Steam is not used."
fi

if [[ -d "${steam_native}" ]]; then
    echo "Native Steam is used."
    script_directory="${steam_native}scripts/"
else
    echo "Native Steam is not used."
fi

# Create the scripts directory.
sudo mkdir -p "${script_directory}"
echo "Steam script dir ${script_directory} created."

open_script="${script_directory}gamma_open.sh"
close_script="${script_directory}gamma_close.sh"

# Create and populate gamma_open.sh
echo '#!/bin/bash' | sudo tee "$open_script" > /dev/null
echo "xrandr --output ${active_output} --gamma ${a_gamma}" | sudo tee -a "$open_script" > /dev/null

# make script exec.
sudo chmod +x "$open_script"

echo "File gamma_open.sh created."

# Create and populate gamma_close.sh.
echo '#!/bin/bash' | sudo tee "$close_script" > /dev/null
echo "xrandr --output ${active_output} --gamma ${d_gamma}" | sudo tee -a "$close_script" > /dev/null

# make script exec.
sudo chmod +x "$close_script"

echo "File gamma_close.sh created."

echo "Process complete."
echo  "This process doesn't programmatically add the launch options to steampath/localconfig.vdf."
echo -e ${RED}"You need to manually add the following to the applicable game launch options:"
echo -e ${GREEN}"${open_script} ; %command% ; ${close_script}"${NC}