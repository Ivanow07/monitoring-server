#!/bin/bash

# Get CPU model
cpu_model=$(lscpu | grep "Model name" | sed -r 's/Model name:\s{1,}//g')

# Get number of CPU cores
cpu_cores=$(nproc)

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Output results
echo "$cpu_model"
echo "$cpu_cores"
echo "$cpu_usage"
