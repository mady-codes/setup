#!/bin/bash

# Create and navigate to the temp directory
mkdir -p ~/temp || { echo "Failed to create ~/temp directory"; exit 1; }
cd ~/temp || { echo "Failed to change directory to ~/temp"; exit 1; }

# Clone the dotfiles repository
git clone https://github.com/mady-codes/dotfiles.git || { echo "Failed to clone repository"; exit 1; }
cd ~ || { echo "Failed to change directory to home"; exit 1; }

chmod +x ~/temp/dotfiles/custom/script/* || { echo "Failed to make scripts executable"; exit 1; }

~/temp/dotfiles/custom/script/AUR-Mirror.sh || { echo "Failed to execute AUR-Mirror.sh"; exit 1; }
~/temp/dotfiles/custom/script/Hyprland.sh || { echo "Failed to execute Hyprland.sh"; exit 1; }
~/temp/dotfiles/custom/script/Ess-Apps.sh || { echo "Failed to execute Ess-Apps.sh"; exit 1; }
~/temp/dotfiles/custom/script/Apps-Conf.sh || { echo "Failed to execute Apps-Conf.sh"; exit 1; }


echo "Installation Complete. Restart Now."
