#!/bin/bash
export gitproxy=http://github.opsp.eu.org/
boot=sda1

# refind
##########################################
mkdir -p /boot/efi
mount /dev/$boot /boot/efi

curl https://udomain.dl.sourceforge.net/project/refind/0.13.3.1/refind-bin-0.13.3.1.zip -o ~/refind.zip
unzip -q ~/refind.zip -d ~/refind_dir
cd ~/refind_dir/refind-*
./refind-install --root /
sed -i "s|ro root=|rw root=|g" /boot/refind_linux.conf

# theme
wget -U 'Mozilla/5.0' ${gitproxy}https://github.com/quantrancse/rEFInd-minimal-themes/archive/master.zip -O ~/theme.zip
unzip -q ~/theme.zip  -d ~/refind_dir_theme
mkdir -p /mnt/boot/efi/EFI/refind/themes/
cp -r ~/refind_dir_theme/rE*/rE* /mnt/boot/efi/EFI/refind/themes/
cp -r ~/refind_dir_theme/rE*/rEFInd-minimal-nord/icons_nord/os_arch.png  \
       /mnt/boot/efi/EFI/refind/themes/rEFInd-minimal-nord/icons_nord/os_artix.png
echo "include themes/rEFInd-minimal-nord/theme.conf" >> /mnt/boot/efi/EFI/refind/refind.conf
cp     /mnt/boot/efi/EFI/refind/themes/rEFInd-minimal-nord/theme.conf  /mnt/boot/efi/EFI/refind/themes/rEFInd-minimal-nord/theme.conf.bac

rm ~/refind.zip ~/theme.zip
rm -r ~/refind_dir ~/refind_dir_theme
