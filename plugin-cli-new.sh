#!/bin/bash
## Nam-Nguyen
## 10/12/2023
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
pwdd=`pwd`
# Mảng chứa danh sách các plugin
# "") install_and_activate_plugin "";;
plugins=(
    "${YELLOW}WP Rocket${NC}"
    "${YELLOW}iThemes Security Pro${NC}"
    "${YELLOW}WPMU Dev Dashboard${NC}"
    "${YELLOW}SEO by Rank Math Pro${NC}"
    "${YELLOW}Elementskit${NC}"
    "${YELLOW}sitepress-multilingual${NC}"
    "${YELLOW}seedprod${NC}"
    "${YELLOW}wp-staging${NC}"
    "${YELLOW}astra-child${NC}"
    "${YELLOW}astra.4.0.2${NC}"
    "${YELLOW}astra-addon-plugin${NC}"
    "${YELLOW}astra-premium-sites${NC}"
    "${YELLOW}migration-unlimited-extension${NC}"
    "${YELLOW}all-in-one-wp-migration${NC}"
    "${YELLOW}Danh sách các plugin đã cài đặt${NC}"
    "${YELLOW}Disable all plugin${NC}"
    "${YELLOW}Enable all plugin${NC}"
    "${YELLOW}Xoá plugin${NC}"
    "${YELLOW}update-plugin${NC}"
    "${YELLOW}update all plugin${NC}"
    "${YELLOW}Show list Theme${NC}"
    "${RED}Thoát${NC}"
)

# Hàm cài đặt và kích hoạt plugin
install_and_activate_plugin() {
    plugin_url=$1
    wp plugin install "$plugin_url" --activate --allow-root
}
# Hàm cài đặt và kích hoạt Theme
install_and_activate_theme() {
    plugin_url=$1
    wp theme install "$plugin_url" --activate --allow-root
}
# Hàm hiển thị danh sách plugin đã cài đặt
display_installed_plugins() {
    wp plugin list --allow-root
}
# Hàm tắt alll plugin
disable_all_plugin() {
wp plugin deactivate --all --allow-root
}
# Hàm Enable all plugin alll plugin
enable_all_plugin() {
wp plugin activate --all --allow-root
}
# Hàm xoá plugin
delete_plugin() {
    # Hiển thị danh sách plugin
    wp plugin list --allow-root | awk 'NR > 2 {print $1}'
    # Nhập tên plugin cần xoá
    read -p "Nhập tên plugin cần xoá: " plugin_name
    # Kiểm tra xem plugin có tồn tại không
    if wp plugin list --allow-root | grep -q "$plugin_name"; then
        wp plugin deactivate "$plugin_name" --allow-root
        wp plugin delete "$plugin_name" --allow-root
        echo "Đã xoá plugin $plugin_name thành công."
    else
        echo "Không tìm thấy plugin $plugin_name."
    fi
}
# Hàm update plugin
update_plugin() {
    # Hiển thị danh sách plugin
    wp plugin list --allow-root | awk 'NR > 2 {print $1}'
    # Nhập tên plugin cần update_plugin
    read -p "Nhập tên plugin cần update: " plugin_update
    # Kiểm tra xem plugin có tồn tại không
    if wp plugin list --allow-root | grep -q "$plugin_update"; then
        wp plugin update "$plugin_update" --allow-root
        echo "Đã update plugin $plugin_update thành công."
    else
        echo "Không tìm thấy plugin $plugin_update."
    fi
}

#Hàm update all plugin
update_all_plugin() {
wp plugin update --all --allow-root
}

#Hàm Hiện Show Theme.
show_theme_list() {
wp theme list --allow-root
}

while true; do
    # Hiển thị menu chọn lựa
    PS3="Chọn plugin để cài đặt (hoặc 0 để thoát): "
    select plugin_name in "${plugins[@]}"; do
        case $plugin_name in
            "WP Rocket") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/wp-rocket_3.12.5.3.zip" ;;
            "iThemes Security Pro") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/ithemes-security-pro.zip" ;;
            "WPMU Dev Dashboard") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/wpmu-dev-dashboard.zip" ;;
            "SEO by Rank Math Pro") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/seo-by-rank-math-pro.zip" ;;
            "Elementskit") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/elementskit-3.2.1.zip" ;;        
            "sitepress-multilingual") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/sitepress-multilingual-cms.4.5.5.zip";;
            "seedprod") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/seedprod.zip";;
            "wp-staging") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/wp-staging-pro.zip";;
            "astra-child") install_and_activate_theme "https://tool.kienthuclinux.info/theme/astra-child.zip";;
            "astra.4.0.2") install_and_activate_theme "https://tool.kienthuclinux.info/theme/astra.4.0.2.zip";;
            "astra-addon-plugin") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra-addon-plugin-4.0.1.zip";;
            "astra-premium-sites") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra-premium-sites-3.1.24.zip";;
            "migration-unlimited-extension") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/all-in-one-wp-migration-unlimited-extension.zip";;
            "all-in-one-wp-migration") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/all-in-one-wp-migration.zip";;
            "Danh sách các plugin đã cài đặt") display_installed_plugins ;;
            "Disable all plugin") disable_all_plugin ;;
            "Enable all plugin") enable_all_plugin ;;
            "Xoá plugin") delete_plugin ;;
            "update-plugin") update_plugin ;;
            "update all plugin") update_all_plugin ;;
            "Show list Theme") show_theme_list ;;
            "Thoát") echo "Thoát chương trình.";
            rm -f ${pwdd}/plugin-cli-new.sh;
            exit ;;
            #"Thoat") echo "Thoát chương trình."; exit ;;
            *) echo "Lựa chọn không hợp lệ. Hãy chọn lại." ;;
        esac
        break
    done
done
rm -f ${pwdd}/plugin-cli-new.sh
