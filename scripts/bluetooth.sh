#!/bin/bash 

if [[ "$OS_ID" != "cachyos" ]]; then
  # Enable Bluetooth
  echo "Enabling bluetooth service"
  sudo systemctl enable bluetooth.service
fi