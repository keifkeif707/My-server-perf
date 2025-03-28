#!/bin/bash
echo "===== Server Performance Stats ====="

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "Total CPU Usage: $CPU_USAGE%"

# Memory Usage
MEMORY=$(free -m | awk 'NR==2{printf "Used: %sMB, Free: %sMB (%.2f%% used)\n", $3,$4,$3*100/($3+$4)}')
echo "Memory Usage: $MEMORY"

# Disk Usage
DISK=$(df -h / | awk 'NR==2{printf "Used: %s, Free: %s (%s used)\n", $3, $4, $5}')
echo "Disk Usage: $DISK"

# Top 5 CPU-consuming processes
echo "Top 5 CPU-consuming processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Memory-consuming processes
echo "Top 5 Memory-consuming processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# OS Version
source /etc/os-release
echo "OS: $PRETTY_NAME"

#Uptime
echo "Uptime:"
uptime -p
