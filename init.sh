#!/bin/sh



chmod +x ~/.config/rofi/*.sh
chmod +x ~/.config/sway/*.sh


#──────────────────────────────────────────────
mkdir ~/.tmp
# cursors & theme ─────────────────────────────────
rm -rf ~/.local/share/fonts
ln -s ~/.config/.local/share/fonts ~/.local/share/fonts

rm -rf ~/.local/share/themes
ln -s ~/.config/.local/share/themes ~/.local/share/themes

# sudo
unzip -q -d ~/.tmp/Graphite-cursors              ~/.config/0-root.tmp/icon/Graphite-cursors.zip
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-light /usr/share/icons/Graphite-light-cursors
sudo cp -r  ~/.tmp/Graphite-cursors/*/dist-dark  /usr/share/icons/Graphite-dark-cursors
# echo 'export XCURSOR_PATH=/usr/share/icons:~/.local/share/icons' >> /etc/environment


# sddm theme ───────────────────────────────────
sudo mkdir -p /usr/share/sddm/themes/
sudo cp -r ~/.config/0-root.tmp/sddm/themes/sddm-sugar-candy /usr/share/sddm/themes/

sudo sddm --example-config > /etc/sddm.conf
# sed -ri 's/^CursorTheme=+.*/CursorTheme="Graphite light Cursors"/' /etc/sddm.conf
sudo sed -ri 's/^Current=+.*/Current=sddm-sugar-candy/' /etc/sddm.conf # maldives elarun maya sugar-light
sudo sed -ri 's/^Numlock=+.*/Numlock=on/' /etc/sddm.conf
sudo sed -ri 's/^MinimumVT=+.*/MinimumVT=7/g' /etc/sddm.conf
sudo sed -ri 's/EnableHiDPI=false/EnableHiDPI=true/g' /etc/sddm.conf

