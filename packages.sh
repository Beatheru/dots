#!/bin/bash

PKGS=(
  # CLI
  btop
  fastfetch
  eza
  bat
  fzf
  ripgrep
  zoxide
  tldr
  wget
  curl
  fd
  rsync
  neovim
  nano

  # Apps
  google-chrome
  zen-browser-bin
  discord
  spotify-launcher
  docker
  yaak-bin
  wireguard-tools
  starship
  ghostty
  localsend-bin
  obsidian
  visual-studio-code-bin

  # Niri
  niri
  xdg-desktop-portal-gtk
  xdg-desktop-portal-gnome
  xwayland-satellite
  udiskie
  polkit-kde-agent

  # Noctalia
  noctalia-shell
  cliphist
  cava
  wlsunset
  xdg-desktop-portal
  evolution-data-server
  matugen
  adw-gtk-theme
  nwg-look
  qt6ct

  # Fonts
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  ttf-jetbrains-mono-nerd
)

echo "Installing packages"
for PKG in "${PKGS[@]}"; do
  sudo paru -S --noconfirm --needed "$PKG"
done

# Hardware acceleration for Intel GPU
if [[ -n "$(lspci | grep -iE 'vga|3d|display' | grep -i 'intel')" ]]; then
  echo "Installing Intel packages"
  paru -S --noconfirm --needed intel-media-driver
fi

# Nvidia drivers. To avoid conflict, user must choose the actual drivers either manually or through the installer.
if [[ -n "$(lspci | grep -iE 'vga|3d|display' | grep -i 'nvidia')" ]]; then
  echo "Installing Nvidia packages"
  paru -S --noconfirm --needed nvidia-utils lib32-nvidia-utils libva-nvidia-driver nvidia-prime nvidia-settings opencl-nvidia lib32-opencl-nvidia
fi