#!/bin/bash
# Nam-Nguyen
# 12/12/2023
# Tăng các thống ở configurations all tất php
lsws_path="/usr/local/lsws"
if [ -d "${lsws_path}" ]; then
    configurations="
    max_execution_time=100
    max_input_time=600
    max_input_vars=5000
    memory_limit=1024M
    post_max_size=512M
    upload_max_filesize=1G
    "
for i in $(ls "${lsws_path}" | grep 'lsphp*'); do
        php_d_path="${lsws_path}/${i}/etc/php.d"
        nam_ini_file="${php_d_path}/namnh-az.ini"

        echo "Adding configurations to ${nam_ini_file}"

        echo "${configurations}" >> "${nam_ini_file}"

        echo "Configurations added to ${nam_ini_file}"
    done
else
    echo "Thư mục ${lsws_path} không tồn tại."
fi

