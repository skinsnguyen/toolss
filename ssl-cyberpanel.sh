#!/bin/bash
## Author : Hoang Nam
## Last Updated : 20/12/2023
## Company : AZDIG
pwdd=`pwd`
cat << "EOF"
 _   _                                          _   _
| \ | | __ _ _   _ _   _  ___ _ __             | \ | | __ _ _ __ ___
|  \| |/ _` | | | | | | |/ _ \ '_ \ _____ _____|  \| |/ _` | '_ ` _ \
| |\  | (_| | |_| | |_| |  __/ | | |_____|_____| |\  | (_| | | | | | |
|_| \_|\__, |\__,_|\__, |\___|_| |_|           |_| \_|\__,_|_| |_| |_|
       |___/       |___/

EOF
echo "! kich hoat ssl cyberpanel !"
read -p "Nhap domain kich hoat ssl : " domain
wget -O - https://get.acme.sh | sh
/root/.acme.sh/acme.sh --register-account -m ${domain}@gmail.com
/root/.acme.sh/acme.sh --issue -d ${domain} -d www.${domain} --cert-file /etc/letsencrypt/live/${domain}/cert.pem --key-file /etc/letsencrypt/live/${domain}/privkey.pem --fullchain-file /etc/letsencrypt/live/${domain}/fullchain.pem -w /home/nova4x4.vn/public_html --force
rm -f ${pwdd}/ssl-cyberpanel.sh
