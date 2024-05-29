#!/bin/bash

# Network interface (you might need to change eth0 to your actual network interface)
interface=eth0

network_in=$(cat /sys/class/net/$interface/statistics/rx_bytes)
network_out=$(cat /sys/class/net/$interface/statistics/tx_bytes)

curl -X POST -H "Content-Type: application/json" -d "{\"in\":\"$network_in\", \"out\":\"$network_out\"}" http://130.61.241.28:8000/update/network
