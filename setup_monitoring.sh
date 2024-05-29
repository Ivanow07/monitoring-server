#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install -y python3-pip

# Create and activate a virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Flask
pip install flask

# Create /monitor directory if it doesn't exist
mkdir -p /monitor

# Download the monitoring scripts
wget -O /monitor/cpu_usage.sh https://raw.githubusercontent.com/Ivanow07/monitoring-server/main/cpu_usage.sh
wget -O /monitor/ram_usage.sh https://raw.githubusercontent.com/Ivanow07/monitoring-server/main/ram_usage.sh
wget -O /monitor/disk_usage.sh https://raw.githubusercontent.com/Ivanow07/monitoring-server/main/disk_usage.sh
wget -O /monitor/network_usage.sh https://raw.githubusercontent.com/Ivanow07/monitoring-server/main/network_usage.sh

# Make the scripts executable
chmod +x /monitor/cpu_usage.sh
chmod +x /monitor/ram_usage.sh
chmod +x /monitor/disk_usage.sh
chmod +x /monitor/network_usage.sh

# Download the Flask app
wget -O /monitor/app.py https://raw.githubusercontent.com/Ivanow07/monitoring-server/main/app.py

# Start the Flask app
nohup python3 /monitor/app.py &
