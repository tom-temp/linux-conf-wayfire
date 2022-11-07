#!/bin/sh

# set revolution



chmod +x ~/.config/rofi/*.sh
chmod +x ~/.config/wofi/*.sh
chmod +x ~/.config/sway/*.sh

mkdir -p ~/.config/zsh
echo "alias set-x11='export WITH_UNIX_BACKEND=x11 && export GDK_BACKEND=x11 &&'" >> ~/.config/zsh/custom_shellapp.zsh



#──────────────────────────────────────────────
mkdir -p ~/.local/share
# font & theme ─────────────────────────────────
rm -rf ~/.local/share/fonts
ln -s ~/.config/.local/share/fonts ~/.local/share/fonts

rm -rf ~/.local/share/themes
ln -s ~/.config/.local/share/themes ~/.local/share/themes

# sudo
# cursors & sddm  ─────────────────────────────────
mkdir ~/.tmp
unzip -q -d ~/.tmp/Graphite-cursors              ~/.config/0-root.tmp/icon/Graphite-cursors.zip
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-light /usr/share/icons/Graphite-light-cursors
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-dark  /usr/share/icons/Graphite-dark-cursors
# echo 'export XCURSOR_PATH=/usr/share/icons:~/.local/share/icons' >> /etc/environment





[Desktop Entry]
Name=Wayfire
Exec=wayfire
TryExec=/opt/wayfire-start.sh
Icon=
Type=Application
DesktopNames=Wayfire