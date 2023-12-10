#!/bin/bash
# Tăng các thống ở configurations all tất php
configurations="
max_execution_time=100
max_input_time=600
max_input_vars=5000
memory_limit=1024M
post_max_size=512M
upload_max_filesize=1G
"

for i in $(ls /usr/local/lsws/ | grep 'lsphp*'); do
    php_d_path="/usr/local/lsws/${i}/etc/php.d"
    nam_ini_file="${php_d_path}/nam.ini"

    echo "Adding configurations to ${nam_ini_file}"

    echo "${configurations}" >> "${nam_ini_file}"

    echo "Configurations added to ${nam_ini_file}"
done