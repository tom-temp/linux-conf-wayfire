#!/bin/bash

ARCH1='x86_64' # 'aarch64'

MAPP_DIR=~/.local
###########################################################################################
export CARGO_HOME=$MAPP_DIR/_env_make/rust-cargo
export RUSTUP_HOME=$MAPP_DIR/_env_make/rust-main
echo "# rust环境变量"                       >> ~/.profile
echo "export CARGO_HOME=${CARGO_HOME}"      >> ~/.profile
echo "export RUSTUP_HOME=${RUSTUP_HOME}"    >> ~/.profile
echo "CARGO=${CARGO_HOME}/bin"              >> ~/.profile
echo "CARGO_HTTP_MULTIPLEXING=false"        >> ~/.profile
echo "RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static"            >> ~/.profile
echo "RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup"     >> ~/.profile
echo  >> ~/.profile

mkdir -p $CARGO_HOME
mkdir -p $CARGO_HOME/../rust-project
mkdir -p $RUSTUP_HOME
cd $CARGO_HOME/../

wget "https://static.rust-lang.org/rustup/dist/${ARCH1}-unknown-linux-gnu/rustup-init"
chmod +x rustup-init

# installtion and set mirrors
./rustup-init --profile minimal

cat > $CARGO_HOME/config  <<EOF
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"
EOF
rm -rf $CARGO_HOME/.package-cache

# wlgreet ──────────────────────────────────────────
cd $CARGO_HOME/../rust-project
wget https://git.sr.ht/~kennylevinsen/wlgreet/archive/0.4.tar.gz
tar -xf 0.4.tar.gz
cd wlgreet-0.4
$CARGO_HOME/bin/cargo build --release
sudo cp target/release/wlgreet /usr/local/bin/

# configration ──────────────────────────────────────────
cp /home/$username/.config/0-root.tmp/bin/wayfire-start.sh       /bin/wayfire-start
cp /home/$username/.config/0-root.tmp/bin/wayfire-start-greet.sh /bin/wayfire-start-greet
chmod +x /bin/wayfire-start
chmod +x /bin/wayfire-start-greet

sudo mkdir -p /usr/share/wallpapers
sudo cp /home/$username/.config/wallpapers/swaylock2.jpg /usr/share/wallpapers/bg.jpg



cat > /etc/greetd/config.toml <<EOF
[terminal]
vt = 7

[default_session]
command = "bash /bin/wayfire-start-greet"
user = "_greeter"
EOF

cat > /etc/greetd/wayfire.ini <<EOF
[autostart]
autostart_wf_shell = false
wlgreet = /usr/bin/wlgreet --command /bin/wayfire-start
wallpaper = swaybg -m fill -i /usr/share/wallpapers/bg.jpg

#qtgreet = /usr/bin/qtgreet

[core]
plugins = autostart command
vheight = 1
vwidth = 1
xwayland = false

[command]
binding_terminal = <super> KEY_ENTER
command_terminal = foot #alacritty #kitty
EOF
