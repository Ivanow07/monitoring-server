#!/bin/bash

disk_used=$(df -h / | tail -n 1 | awk '{print $3}')
disk_available=$(df -h / | tail -n 1 | awk '{print $4}')
disk_total=$(df -h / | tail -n 1 | awk '{print $2}')

echo "$disk_used,$disk_available,$disk_total"
