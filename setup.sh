#!/bin/bash

# Run Reflector
echo "Intalling reflector"
sudo pacman -S --noconfirm --needed reflector
echo "Running reflector"
sudo reflector --verbose --protocol https --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

# Configure pacman configuration
## Enable color
echo "Enabling pacman color"
sudo sed -i '/^#Color/s/^#//' /etc/pacman.conf
## Add ILoveCandy after Color if not present
if [[ -z "$(grep 'ILoveCandy' /etc/pacman.conf)" ]]; then
  echo "Adding ILoveCandy"
  sudo sed -i '/^Color/a\ILoveCandy' /etc/pacman.conf
fi
## Enable VerbosePkgLists
echo "Enabling VerbosePkgLists"
sudo sed -i '/^#VerbosePkgLists/s/^#//' /etc/pacman.conf

# Update system
echo "Updating system"
sudo pacman -Syu --noconfirm

# Install Paru
echo "Installing Paru"
sudo pacman -S --noconfirm --needed base-devel
if ! command -v paru &>/dev/null; then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/paru
fi

# Copy configs
echo "Copying configs to .config"
mkdir -p ~/.config
cp -R $SRC_DIR/.config/* ~/.config/
cp $SRC_DIR/bashrc ~/.bashrc