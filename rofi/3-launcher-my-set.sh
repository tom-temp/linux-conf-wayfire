#!/usr/bin/env bash



case "$*" in 
    "v2ray") 
        # dosomething
        notify-send "abc"
        echo "v2ray-yes"
        echo "v2ray-no"
    ;;
    "v2ray-yes")
        notify-send "abc"
    ;;
    "v2ray-no")
        notify-send "abc"
    ;;

    "rsync")
        notify-send "7"
    ;;
    "git")
        notify-send "8"
    ;;
    # 菜单
    "")
        echo v2ray
        echo rsync
        echo git
    ;;
esac

# dmunu 选择文件
# filename=$(ls | rofi -dmemu)
# history | rofi -dmemu

