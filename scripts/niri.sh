#!/bin/bash

# Fix Niri high VRAM usage with NVIDIA. See https://yalter.github.io/niri/Nvidia.html
if [[ -n "$(lspci | grep -iE 'vga|3d|display' | grep -i 'NVIDIA')" ]]; then
  echo "Fixing Niri VRAM issues with Nvidia"
  mkdir -p /etc/nvidia/nvidia-application-profiles-rc.d
  sudo cp ./configs/50-limit-free-buffer-pool-in-wayland-compositors.json /etc/nvidia/nvidia-application-profiles-rc.d/
fi

# Set gtk settings
echo "Setting gtk-theme to 'adw-gtk3'"
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
echo "Setting color-scheme to 'prefer-dark'"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'