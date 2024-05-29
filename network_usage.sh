#!/bin/bash

# Network interface to monitor (you can change 'eth0' to your specific interface if needed)
INTERFACE="eth0"

# Get network usage
rx_bytes=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
tx_bytes=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
rx_bytes_new=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
tx_bytes_new=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

rx_rate=$((($rx_bytes_new - $rx_bytes) / 1024))
tx_rate=$((($tx_bytes_new - $tx_bytes) / 1024))

# Output results
echo "$rx_rate,$tx_rate"
