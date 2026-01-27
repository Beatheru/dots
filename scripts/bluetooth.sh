#!/bin/bash 

if [[ "$OS_ID" -ne "cachyos" ]]; then
  # Enable Bluetooth
  echo "Enabling bluetooth service"
  sudo systemctl enable bluetooth.service
fi