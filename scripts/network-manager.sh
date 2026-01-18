#!/bin/bash 

# Install NetworkManager
echo "Installing NetworkManager"
paru -S --noconfirm --needed networkmanager iwd

# Use iwd as a backend
echo "Configuring iwd as NetworkManager backend"
sudo systemctl disable iwd
cat <<EOF | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf
[device]
wifi.backend=iwd
EOF

# Enable NetworkManager
echo "Enabling NetworkManager"
sudo systemctl enable NetworkManager