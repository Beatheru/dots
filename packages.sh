#!/bin/bash

# Install all packages listed in the package file
PACKAGE_FILE="packages.list"

echo "Installing packages"
mapfile -t packages < <(grep -v '^#' "$PACKAGE_FILE" | grep -v '^$')
paru -S --noconfirm --needed "${packages[@]}"

# Hardware acceleration for Intel GPU
if [[ -n "$(lspci | grep -iE 'vga|3d|display' | grep -i 'intel')" ]]; then
  echo "Installing Intel packages"
  paru -S --noconfirm --needed intel-media-driver
fi

# Nvidia drivers
if [[ -n "$(lspci | grep -iE 'vga|3d|display' | grep -i 'nvidia')" ]]; then
  echo "Installing Nvidia packages"
  paru -S --noconfirm --needed dkms linux-headers nvidia-open-dkms nvidia-utils lib32-nvidia-utils libva-nvidia-driver
fi