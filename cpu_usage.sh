#!/bin/bash

cpu_model=$(lscpu | grep 'Model name' | awk -F: '{print $2}' | xargs)
cpu_cores=$(lscpu | grep '^CPU(s):' | awk -F: '{print $2}' | xargs)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

curl -X POST -H "Content-Type: application/json" -d "{\"model\":\"$cpu_model\", \"cores\":\"$cpu_cores\", \"usage\":\"$cpu_usage\"}" http://130.61.241.28:8000/update/cpu
