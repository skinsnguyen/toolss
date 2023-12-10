#!/bin/bash
## Nam-Nguyen
## 24/10/2023
# Initialize a total memory variable
pwdd=`pwd`
total_memory=0

# Use ps to list all running processes, exclude the header, and calculate memory usage for each service in MB
ps aux --sort -rss | awk 'NR > 1 {
    service_name = $11;
    memory_usage = $6 / 1024; # Convert memory usage from KB to MB
    service_memory[service_name] += memory_usage;
}
END {
    printf "%-30s %s\n", "Service", "Memory Usage (MB)";
    for (service in service_memory) {
        if (service_memory[service] > 0) {
            printf "%-30s %.2f MB\n", service, service_memory[service];
            total_memory += service_memory[service];
        }
    }
    printf "%-30s %.2f MB\n", "Total Memory Usage:", total_memory;
}' | sort -k2,2nr
rm -f ${pwdd}/calc-ram.sh
