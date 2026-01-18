#!/bin/bash 

# Enable Reflector
echo "Enabling reflector service"
sudo systemctl enable reflector.service
sudo systemctl enable reflector.timer