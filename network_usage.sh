#!/bin/bash

network_in=$(cat /proc/net/dev | grep eth0 | awk '{print $2}')
network_out=$(cat /proc/net/dev | grep eth0 | awk '{print $10}')

echo "$network_in,$network_out"
