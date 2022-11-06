#!/bin/bash
export gitproxy=http://github.opsp.eu.org/
export username=tom

xbps-remove -R grub-i386-efi grub-x86_64-efi grub efibootmgr libefivar lvm2 os-prober thin-provisioning-tools 

xbps-install -S
xbps-install fuse vsv unzip xz curl wget p7zip-unrar
xbps-install linux-headers
xbps-install seatd elogind mate-polkit

xbps-install mesa mesa-dri # mesa-demos libva-utils
xbps-install vulkan-loader intel-media-driver mesa-vulkan-intel intel-video-accel # nvidia
xbps-install glfw-wayland glew libglvnd #  nvidia340-libs
xbps-install qt5-core gtk+3

# wayfire
xbps-install wayfire wcm  
xbps-install swaylock swaybg swayidle wlogout sway-audio-idle-inhibit
xbps-install qt5-wayland kwayland xorg-server-xwayland # weston-xwayland
xbps-install wlr-randr wdisplays # kanshi
# wayabr
xbps-install Waybar

# tools
xbps-install foot rofi mpv Thunar

# theme
xbps-install lxappearance qt5-svg qt5ct qt5-styleplugins papirus-icon-theme # xsettingsd

# system tools
xbps-install pulseaudio pavucontrol #volctl light
# thunar-archive-plugin file-roller 
##########################################################

xbps-install libevdev  # KeyboardState module

# xbps-install xdg-utils

# xbps-install mako  # dunst # notification daemon

# wl-clipboard
# grim wf-recorder grimshot 截图与录屏
# xdg-desktop-portal-wlr # screen sharing for wayland
# brightnessctl # brightness manager
# libappindicator # tray sway

# application
xbps-install libgpg-error # clash 客户端需要

# application apps
# nwg-bar #(Super+x). Presents the user with a choice of Lock, Logout, Reboot and Shutdown.
# alacritty
# xbps-install nwg-launchers
# xbps-install network-manager-applet

# xbps-install virtualbox-ose-guest

echo "ignorepkg=adwaita-icon-theme" >> /etc/xbps.d/99-ignore.conf
xbps-remove adwaita-icon-theme

ln -s /etc/sv/seatd     /var/service/
ln -s /etc/sv/dbus      /var/service/
ln -s /etc/sv/polkitd   /var/service/
# ln -s /etc/sv/elogind /var/service/

gpasswd -a $username _seatd
gpasswd -a $username dbus
gpasswd -a $username input

##########################################
# display manager
##########################################

# could use  greetd with tuigreet
##########################################
# xbps-install greetd tuigreet
# ln -s /etc/sv/greetd /var/service/
# gpasswd -a _greeter _seatd
# gpasswd -a _greeter dbus
# gpasswd -a _greeter input

# # tui
# cat > /etc/greetd/config.toml <<EOF
# [terminal]
# vt = 7

# [default_session]
# command = "tuigreet --cmd 'dbus-launch --exit-with-session wayfire -c ~/.config/wayfire.ini >> ~/.config/wayfire.log 2>&1'"
# user = "_greeter"
# EOF

# set environment
# 在wayfire启动脚本中修改
##########################################
# echo "export WLR_NO_HARDWARE_CURSORS=1"     >> /etc/environment   # virtual-box curssors
# echo "export LIBGL_ALWAYS_SOFTWARE=1"       >> /etc/environment   # virtual-box software
# echo "export QT_QPA_PLATFORM=wayland-egl"   >> /etc/environment   # Qt5-based
# echo "export ELM_DISPLAY=wl"                >> /etc/environment   # EFL-based
# echo "export SDL_VIDEODRIVER=wayland"       >> /etc/environment   # SDL-based
# echo "export GDK_BACKEND=wayland"           >> /etc/environment   # GDK-based
# echo "export CLUTTER_BACKEND=wayland"       >> /etc/environment   # 
# echo "export MOZ_ENABLE_WAYLAND=1"          >> /etc/environment   # Wayland firefox
# # Session
# echo "export XDG_SESSION_TYPE=wayland"      >> /etc/environment
# echo "export XDG_SESSION_DESKTOP=wayfire"   >> /etc/environment
# echo "export XDG_CURRENT_DESKTOP=wayfire"   >> /etc/environment

echo 'export QT_QPA_PLATFORMTHEME=qt5ct'    >> /etc/environment

# dir
echo 'export XDG_CACHE_HOME=~/.local/var/cache' >> /etc/environment
echo 'export XDG_CONFIG_HOME=~/.local/etc'      >> /etc/environment
echo 'export XDG_DATA_HOME=~/.local/share'      >> /etc/environment
echo 'export XDG_STATE_HOME=~/.local/var/lib'   >> /etc/environment

echo 'export XDG_DESKTOP_DIR=~/use-data/desktop'      >> /etc/environment
echo 'export XDG_DESKTOP_DIR=~/use-data/0-download'   >> /etc/environment

####################################################################################
# Install fonts
##########################################

mkdir -p ~/.tmp
cd       ~/.tmp

mkdir -p /usr/share/fonts/myfonts
Install_nerd_font() {
wget -U 'Mozilla/5.0' ${gitproxy}https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/${1}.zip

unzip -qq ${1}.zip -d ~/.tmp/${1}
rm ~/.tmp/${1}/*'Windows Compatible.ttf'
rm ~/.tmp/${1}/*'Windows Compatible.otf'
mv ~/.tmp/${1}/* /usr/share/fonts/myfonts/
}

# Install_nerd_font FiraCode
# Install_nerd_font FiraMono
Install_nerd_font CodeNewRoman
Install_nerd_font Hack
# Install_nerd_font Go-Mono

mkdir -p /usr/share/fonts/siyuan_cjk

Install_siyuan_font() {
wget -U 'Mozilla/5.0' ${gitproxy}https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/${1}.zip

unzip -qq ${1}.zip -d ~/.tmp/${1}
mv ~/.tmp/${1}/* /usr/share/fonts/siyuan_cjk/
}

Install_siyuan_font 06_NotoSansCJKjp
Install_siyuan_font 07_NotoSansCJKkr
Install_siyuan_font 08_NotoSansCJKsc
Install_siyuan_font 09_NotoSansCJKtc
Install_siyuan_font 13_NotoSansMonoCJKsc

chmod -R 755 /usr/share/fonts/

xbps-reconfigure -f fontconfig
rm -r ~/.tmp










# , ，分辨率，双屏，浏览器，图片查看，nnn，office，，   剪贴板 截图  vsv proton
# wofi --show=drun
# Thunar
#




# tory commend
##########################################
# network-manager-applet

# nm-applet --indicator &

# polkit






WAYLAND_DISPLAY=alacritty alacritty







# fcitx
##########################################


echo "GTK_IM_MODULE=fcitx" >> ~/.pam_environment
echo "QT_IM_MODULE=fcitx" >> ~/.pam_environment
echo "XMODIFIERS=@im=fcitx" >> ~/.pam_environment
##########################################

xbps-query -Rs tlp

pidof


jgmenu 类似于快速启动菜单
