#!/bin/bash

sudo useradd -s /sbin/nologin prometheus

# TO DO
# 1. Retrieve user-specified Prometheus package
# 2. Extract package
# 3. Move Prometheus binaries into /usr/local/bin
# 4. Create config dir @ /etc/prometheus and cp -r prometheus-*/consoles to it
# 5. Create data dir @ /var/lib/prometheus cp -r prometheus-*/console_libraries to it
# 3. Change ownership of everything above to prometheus:prometheus
# 4. Setup Prometheus as a systemd service
