#!/bin/bash

# Get number of CPU cores
cpu_cores=$(grep -c ^processor /proc/cpuinfo)

# Get total RAM in MB
total_ram=$(free -m | grep "Mem:" | awk '{print $2}')

# Calculate Apache settings
server_limit=$((10 * cpu_cores))
max_request_workers=$((10 * cpu_cores))
threads_per_child=25
start_servers=$((cpu_cores / 2))
min_spare_threads=$((threads_per_child * 2))
max_spare_threads=$((threads_per_child * 4))
max_connections_per_child=1000

# Echo the calculated settings
echo "Number of CPU cores: $cpu_cores"
echo "Total RAM: ${total_ram}MB"
echo "Calculated Apache Settings:"
echo "server_limit: $server_limit"
echo "max_request_workers: $max_request_workers"
echo "threads_per_child: $threads_per_child"
echo "start_servers: $start_servers"
echo "min_spare_threads: $min_spare_threads"
echo "max_spare_threads: $max_spare_threads"
echo "max_connections_per_child: $max_connections_per_child"
echo ""

# Prompt to create Apache configuration
echo "Next steps:"
echo "1. Open your Apache configuration file (e.g., sudo nano /etc/apache2/apache2.conf)."
echo "2. Add or modify the calculated settings based on your requirements."
echo "3. Save the file and exit the text editor."
echo "4. Restart or reload the Apache service to apply the changes (e.g., sudo systemctl restart apache2)."