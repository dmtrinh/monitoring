#!/bin/bash

if [ -z "$1" ]
then
  echo "First, find the specific release you want @"
  echo "  https://github.com/prometheus/node_exporter/releases"
  echo
  echo "Syntax:"
  echo "  ./setup_node_exporter.sh <url-to-node-exporter-release>"
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

echo "Attempting to start Node_exporter..."
sudo systemctl restart node_exporter
sudo systemctl status node_exporter