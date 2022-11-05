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


# sddm theme ───────────────────────────────────
sudo mkdir -p /usr/share/sddm/themes/
sudo cp -r ~/.config/0-root.tmp/sddm/themes/sddm-sugar-candy /usr/share/sddm/themes/

sddm --example-config > ~/.tmp/sddm.conf
# sed -ri 's/^CursorTheme=+.*/CursorTheme="Graphite light Cursors"/' ~/.tmp/sddm.conf
sed -ri 's/^Current=+.*/Current=sddm-sugar-candy/' ~/.tmp/sddm.conf # maldives elarun maya sugar-light
sed -ri 's/^Numlock=+.*/Numlock=on/'               ~/.tmp/sddm.conf
sed -ri 's/^MinimumVT=+.*/MinimumVT=7/g'           ~/.tmp/sddm.conf
sed -ri 's/EnableHiDPI=false/EnableHiDPI=true/g'   ~/.tmp/sddm.conf

sudo cp ~/.tmp/sddm.conf /etc/sddm.conf
