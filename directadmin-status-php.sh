#!/bin/bash

directory="/usr/local/"

# Check if /usr/local/ exists
if [ ! -d "$directory" ]; then
    echo "Error: /usr/local/ directory does not exist."
    exit 1
fi

PS3="Select an option: "
options=("Restart PHP-FPM" "Check Status" "Quit")

select opt in "${options[@]}"; do
    case $opt in
        "Restart PHP-FPM")
            for i in $(ls "$directory" | grep 'php[0-9]*'); do
                version=$(echo ${i} | grep -o '[0-9]*')
                systemctl restart php-fpm${version}
            done
            ;;
        "Check Status")
            for i in $(ls "$directory" | grep 'php[0-9]*'); do
                version=$(echo ${i} | grep -o '[0-9]*')
                systemctl status php-fpm${version}
            done
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option";;
    esac
done
