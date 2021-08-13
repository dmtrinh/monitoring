#!/bin/bash

echo "Retrieving Node_exporter package..."
curl -LO $1

echo "Extracting binary into /usr/local/bin..."
sudo tar -zxvf node_exporter*.tar.gz -C /usr/local/bin --wildcards "*/node_exporter" --strip-components=1

echo "Configuring Node_exporter as a systemd service..."
sudo cp node_exporter.service /etc/systemd/system
sudo systemctl daemon-reload
echo "... Done!"

echo "Attempting to start Node_exporter..."
sudo systemctl start node_exporter
sudo systemctl status node_exporter
