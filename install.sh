#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu
echo "System packages updated."

# Install AUR helper
echo "Installing AUR helper..."
mkdir -p ~/aur
cd ~/aur
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
echo "AUR helper installed."

# Update mirrorlist
echo "Updating mirrorlist..."
yay -S rate-mirrors --noconfirm
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
sudo pacman -Syy
echo "Mirrorlist updated."

# Install Hyprland and related packages from AUR
echo "Installing Hyprland and related packages..."
yay -S --needed --noconfirm \
    hyprland-git \
    hyprland-protocols-git \
    aquamarine-git \
    xdg-desktop-portal-hyprland-git \
    hyprwayland-scanner-git \
    hyprgraphics-git \
    hyprcursor-git \
    hypridle-git \
    hyprlang-git \
    hyprlock-git \
    hyprshot-git \
    hyprutils-git \
    hyprpolkitagent-git
echo "Hyprland and related packages installed."

# Install terminal emulator and file manager
echo "Installing terminal emulator and file manager..."
sudo pacman -S --needed --noconfirm \
    kitty \
    kitty-shell-integration \
    kitty-terminfo \
    thunar \
    thunar-archive-plugin \
    thunar-media-tags-plugin \
    thunar-shares-plugin \
    thunar-vcs-plugin \
    thunar-volman
echo "Terminal emulator and file manager installed."

# Install SDDM and related packages
echo "Installing SDDM and related packages..."
sudo pacman --noconfirm --needed -S \
    sddm \
    qt6-svg \
    qt6-virtualkeyboard \
    qt6-multimedia-ffmpeg
echo "SDDM and related packages installed."

# Configure SDDM theme
echo "Configuring SDDM theme..."
mkdir -p ~/temp
cd ~/temp
git clone https://github.com/mady-codes/dotfiles.git
cd dotfiles
sudo cp -rf joker /usr/share/sddm/themes/
sudo mkdir -p /usr/share/fonts/Electroharmonix
sudo cp -rf /usr/share/sddm/themes/joker/Fonts/* /usr/share/fonts/Electroharmonix
systemctl enable sddm.service
echo "SDDM theme configured."

# Configure GRUB theme
echo "Configuring GRUB theme..."
sudo cp -rf sekiro /usr/share/grub/themes
echo 'GRUB_THEME="/usr/share/grub/themes/sekiro/theme.txt"' | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB theme configured."

echo "All tasks are completed!"
