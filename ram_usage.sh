#!/bin/bash

# Get RAM usage details
ram_total=$(free -m | awk '/^Mem:/{print $2}')
ram_used=$(free -m | awk '/^Mem:/{print $3}')
ram_available=$(free -m | awk '/^Mem:/{print $7}')

# Output results
echo "$ram_used,$ram_available,$ram_total"
