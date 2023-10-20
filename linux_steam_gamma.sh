#!/bin/bash
# Please edit --gamma to your prefence below.
# This script is for flatpack steam game install locations. Execute it as your regular user account.
# Install xrandr via distro package manager.
# Check if the system is running a Debian-based distribution.
if [ -f /etc/debian_version ]; then
    # Install xrandr using the apt package manager (for Debian/Ubuntu).
    sudo apt update
    sudo apt install xrandr

# Check if the system is running a Red Hat-based distribution.
elif [ -f /etc/redhat-release ]; then
    # Install xrandr using the yum package manager (for CentOS/Fedora).
    sudo dnf install xrandr

# Check if the system is running an Arch-based distribution.
elif [ -f /etc/arch-release ]; then
    # Install xrandr using the pacman package manager (for Arch Linux).
    sudo pacman -S xorg-xrandr

# If the distribution is not recognized.
else
    echo "Unsupported distribution. Please install xrandr manually."
fi

# color daddy
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Define the user with directory path and gamma script names.
current_user=$(whoami)
active_output=$(xrandr --query | awk '/ connected/ && / primary/ {print $1}')
script_directory="/home/${current_user}/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/scripts/"

open_script="${script_directory}gamma_open.sh"

close_script="${script_directory}gamma_close.sh"

# Create the scripts directory.
sudo mkdir -p "$script_directory"
echo "Steam script dir ${script_directory} created."

# Create and populate open.sh
echo '#!/bin/bash' | sudo tee "$open_script" > /dev/null

# Add the discovered output to open.sh. 
echo "xrandr --output ${active_output} --gamma 1.20:1.20:1.20" | sudo tee -a "$open_script" > /dev/null

# make script exec.
sudo chmod +x "$open_script"

echo "File open.sh created."

# Create and populate close.sh.
echo '#!/bin/bash' | sudo tee "$close_script" > /dev/null

# Add the discovered output to close.sh. 
echo "xrandr --output ${active_output} --gamma 1.00:1.00:1.00" | sudo tee -a "$close_script" > /dev/null

# make script exec.
sudo chmod +x "$close_script"

echo "File close.sh created."

echo "Process complete."
echo  "This process doesn't programmatically add the launch options to steampath/localconfig.vdf."
echo -e ${RED}"You need to manually add the following to the applicable game launch options:"
echo -e ${GREEN}"/home/${current_user}/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/scripts/gamma_open.sh ; %command% ; /home/${current_user}/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/scripts/gamma_close.sh"${NC}
