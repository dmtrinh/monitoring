#!/bin/bash

echo "Retrieving Node_exporter..."
curl -LO $1

echo "Configuring Node_exporter as a systemd service..."
sudo cp node_exporter.service /etc/systemd/system
sudo systemctl daemon-reload
echo "... Done!"

echo "Attempting to start Node_exporter..."
sudo systemctl start node_exporter
sudo systemctl status node_exporter
