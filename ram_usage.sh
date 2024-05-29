#!/bin/bash

ram_used=$(free -m | grep Mem | awk '{print $3}')
ram_available=$(free -m | grep Mem | awk '{print $7}')
ram_total=$(free -m | grep Mem | awk '{print $2}')

echo "$ram_used,$ram_available,$ram_total"
