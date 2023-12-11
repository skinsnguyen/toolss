#!/bin/bash
# Nam-Nguyen
# 12/12/2023
directory="/usr/local"

# Kiểm tra xem thư mục có tồn tại hay không
if [ -d "${directory}" ]; then
    configurations="
    max_execution_time=100
    max_input_time=600
    max_input_vars=5000
    memory_limit=1024M
    post_max_size=512M
    upload_max_filesize=1G
    "

    for i in $(ls "${directory}" | grep 'php*'); do
        php_d_path="${directory}/${i}/lib/php.conf.d"
        nam_ini_file="${php_d_path}/nam.ini"

        echo "Adding configurations to ${nam_ini_file}"
        
        # Thêm cấu hình mà không kiểm tra xem file có tồn tại hay không
        echo "${configurations}" >> "${nam_ini_file}"
        echo "Configurations added to ${nam_ini_file}"
    done
else
    echo "Thư mục ${directory} không tồn tại."
fi
