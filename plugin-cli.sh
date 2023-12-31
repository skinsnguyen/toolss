#!/bin/bash
# Mảng chứa danh sách các plugin
plugins=("WP Rocket" "iThemes Security Pro" "WPMU Dev Dashboard" "SEO by Rank Math Pro" "Elementskit" "sitepress-multilingual" "seedprod" "wp-staging" "astra-child" "astra.4.0.2" "astra-addon-plugin" "astra-premium-sites" "migration-unlimited-extension" "all-in-one-wp-migration")

# Hàm cài đặt và kích hoạt plugin
install_and_activate_plugin() {
    plugin_url=$1
    wp plugin install "$plugin_url" --activate --allow-root
}

# Hiển thị menu chọn lựa
PS3="Chọn plugin để cài đặt: "
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
        "astra-child") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra-child.zip";;
        "astra.4.0.2") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra.4.0.2.zip";;
        "astra-addon-plugin") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra-addon-plugin-4.0.1.zip";;
        "astra-premium-sites") install_and_activate_plugin "https://tool.kienthuclinux.info/theme/astra-premium-sites-3.1.24.zip";;
        "migration-unlimited-extension") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/all-in-one-wp-migration-unlimited-extension.zip";;
        "all-in-one-wp-migration") install_and_activate_plugin "https://tool.kienthuclinux.info/plugin/all-in-one-wp-migration.zip";;
        *) echo "Lựa chọn không hợp lệ. Hãy chọn lại." ;;
    esac
    break
done

# Thông báo khi quá trình cài đặt hoàn tất
echo "Quá trình cài đặt plugin đã hoàn tất."
