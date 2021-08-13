#!/bin/bash

if [ -z "$1" ]
then
  echo "First, find the specific release you want @"
  echo "  https://github.com/prometheus/node_exporter/releases"
  echo
  echo "Usage:"
  echo "  $0 <url-to-node-exporter-release>"
  echo
  echo "Exxample:"
  echo "  $0 https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz"
  exit
fi

echo "Retrieving Node_exporter package..."
curl -LO $1

echo "Extracting binary into /usr/local/bin..."
sudo tar -zxvf node_exporter*.tar.gz -C /usr/local/bin --wildcards "*/node_exporter" --strip-components=1
sudo chown prometheus:prometheus /usr/local/bin/node_exporter

echo "Configuring Node_exporter as a systemd service..."
sudo cp node_exporter.service /etc/systemd/system
sudo systemctl daemon-reload
echo "... Done!"

# Uncomment the line below only if you want node_exporter to automatically start even after server reboot
#sudo systemctl enable node_exporter

echo "Attempting to start Node_exporter..."
sudo systemctl restart node_exporter
sudo systemctl status node_exporter