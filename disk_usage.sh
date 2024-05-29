#!/bin/bash

# Get Disk usage details
disk_total=$(df -h / | grep / | awk '{print $2}')
disk_used=$(df -h / | grep / | awk '{print $3}')
disk_available=$(df -h / | grep / | awk '{print $4}')

# Output results
echo "$disk_used,$disk_available,$disk_total"
