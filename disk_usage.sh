#!/bin/bash

disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_available=$(df -h / | awk 'NR==2 {print $4}')
disk_total=$(df -h / | awk 'NR==2 {print $2}')

curl -X POST -H "Content-Type: application/json" -d "{\"used\":\"$disk_used\", \"available\":\"$disk_available\", \"total\":\"$disk_total\"}" http://130.61.241.28:8000/update/disk
