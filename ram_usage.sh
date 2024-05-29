#!/bin/bash

ram_used=$(free -m | awk '/Mem:/ {print $3}')
ram_available=$(free -m | awk '/Mem:/ {print $7}')
ram_total=$(free -m | awk '/Mem:/ {print $2}')

curl -X POST -H "Content-Type: application/json" -d "{\"used\":\"$ram_used\", \"available\":\"$ram_available\", \"total\":\"$ram_total\"}" http://130.61.241.28:8000/update/ram
