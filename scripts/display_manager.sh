#!/bin/bash

if [[ "$OS_ID" != "cachyos" ]]; then
  # Install Ly display manager
  echo "Installing Ly"
  paru -S --noconfirm --needed ly
  echo "Disabling getty service"
  sudo systemctl disable getty@tty1.service
  echo "Enabling ly service"
  sudo systemctl enable ly@tty1.service

  echo "Configuring Ly autologin"
  cat <<EOF | sudo tee /etc/ly/config.ini
auto_login_session = niri
auto_login_user = $USER
EOF
fi