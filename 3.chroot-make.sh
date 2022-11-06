#!/bin/bash

mount -t proc proc proc/
echo "domain lan" >> /etc/resolv.conf
echo "nameserver 192.168.2.251" >> /etc/resolv.conf

mkdir -p /etc/xbps.d

cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
echo "repository=https://mirrors.tuna.tsinghua.edu.cn/voidlinux/current" > /etc/xbps.d/00-repository-main.conf

xbps-install -S
xbps-install base-devel cmake gcc-objc++ readline-devel
xbps-install linux5.19-headers

mkdir ~/.tmp
cd ~/.tmp

# ly ────────────────────────────────────────────
# git clone --recurse-submodules https://github.com/fairyglade/ly
# cd ly
# make

# sudo make install installrunit
# sudo ln -s /etc/sv/ly /var/service/
# rm /var/service/agetty-tty2

# greetd ──────────────────────────────────────────
sudo xbps-install greetd
ln -s /etc/sv/greetd /var/service/
sudo gpasswd -a _greeter _seatd
sudo gpasswd -a _greeter dbus
sudo gpasswd -a _greeter input

cat > /etc/greetd/config.toml <<EOF
[terminal]
vt = 7

[default_session]
command = "wayfire -c /etc/greetd/wayfire.ini"
user = "_greeter"
EOF

cat > /etc/greetd/wayfire.ini <<EOF
[autostart]
autostart_wf_shell = false
wlgreet = /usr/bin/wlgreet -l
#qtgreet = /usr/bin/qtgreet

[core]
plugins = autostart
vheight = 1
vwidth = 1
xwayland = false
EOF
