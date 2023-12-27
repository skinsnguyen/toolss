#!/bin/bash

# Nhập tên người dùng từ người dùng
read -p "Nhập tên người dùng: " user_name

# Kiểm tra xem người dùng có tồn tại trong MySQL hay không
exists=$(mysql -s -N -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$user_name');")
if [ "$exists" -eq 0 ]; then
    echo "Người dùng '$user_name' không tồn tại trong MySQL."
    exit 1  # Thoát script với mã lỗi 1
fi

while true; do
    # Lấy ra các lệnh KILL cho các phiên kết nối từ user 'admin_home'
    mysql -e "Select concat('KILL ',id,';') from information_schema.processlist where user='$user_name'" | tail -n +2 | tr -d "|" | while read -r kill_command; do
        # Thực hiện lệnh KILL

        mysql -e "$kill_command"
        echo "Executed: $kill_command"
    done
    echo "Tiến thành kill các ID của $user_name trong MySQL."
    # Chờ một khoảng thời gian trước khi lặp lại
    sleep 10
done
