#!/bin/bash

# Create and navigate to the temp directory
mkdir -p ~/temp || { echo "Failed to create ~/temp directory"; exit 1; }
cd ~/temp || { echo "Failed to change directory to ~/temp"; exit 1; }

# Clone the dotfiles repository
git clone https://github.com/mady-codes/dotfiles.git || { echo "Failed to clone repository"; exit 1; }
cd ~ || { echo "Failed to change directory to home"; exit 1; }

chmod +x ~/temp/dotfiles/custom/script/* || { echo "Failed to make scripts executable"; exit 1; }

~/temp/dotfiles/custom/script/aur_mirror.sh || { echo "Failed to execute aur_mirror.sh"; exit 1; }
~/temp/dotfiles/custom/script/hyprland_install.sh || { echo "Failed to execute hyprland_install.sh"; exit 1; }
~/temp/dotfiles/custom/script/copy_config.sh || { echo "Failed to execute copy_config.sh"; exit 1; }
~/temp/dotfiles/custom/script/essentials.sh || { echo "Failed to execute essentials.sh"; exit 1; }
~/temp/dotfiles/custom/script/applications.sh || { echo "Failed to execute applications.sh"; exit 1; }

echo "Installation Complete. Changing Shell Now. Restart Once Completed"

chsh -s /bin/zsh || { echo "Failed to change shell to zsh"; exit 1; }
