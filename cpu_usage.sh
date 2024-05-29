#!/bin/bash

cpu_model=$(cat /proc/cpuinfo | grep 'model name' | uniq | awk -F ':' '{print $2}' | xargs)
cpu_cores=$(nproc)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

echo "$cpu_model"
echo "$cpu_cores"
echo "$cpu_usage"
