#!/bin/bash

#1.
grep -A 1 China > /etc/pacman.d/mirrorlist
sed -i 's/--//g' /etc/pacman.d/mirrorlist
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf
echo "Done: mirrorlist"

#2.
rm /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
echo "Done: Time sync"

#3.
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo "Done: locale"

#4.
HOSTNAME=arch
echo $HOSTNAME > /etc/hostname

/etc/hosts
echo "127.0.0.1		localhost" > /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1		$HOSTNAME.localdomain	$HOSTNAME" >> /etc/hosts

systemctl enable dhcpcd@enp0s3.service
echo "Done: Network"

#5.
echo "Sync mirror..."
pacman -Sy
echo "Done: sync"

#6.
pacman -S linux-headers
echo "Done: install headers"

#7.
#if EFI
#*EFI*:
#pacman -S efibootmgr grub-efi-x86_64
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug
#Tested, It had no effect on me. Please ignore step: 24
#cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo (Not sure about this, need to check)
#else
#*NON EF*: GeneralBios:
pacman -S grub
grub-install --target=i386-pc /dev/sda
#endif

grub-mkconfig -o /boot/grub/grub.cfg
echo "Done: install grub"

#8.
echo "Changing root password..."
passwd #Change root pswd

#9.
echo "Add user wds password..."
useradd -m -g users -G wheel,storage,power -s /bin/bash wds 
passwd wds 

#APPs install
pacman -S wqy-zenhei
pacman -S yaourt git openssh vim virtualbox-guest-utils virtualbox-guest-modules-arch
pacman -S xorg-server xorg-xinit xorg-apps

exit
##############################################################################################
sudo pacman -S fcitx fcitx-im # 全部安装
sudo pacman -S fcitx-configtool # 图形化配置工具

在~/.xprofile文件里面添加下面三行

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

作者：MrJiRen
链接：https://www.jianshu.com/p/9e8fe8892b61
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
##############################################################################################
*Not try for yaourt* 加速yaourt

都知道pacman能够调用外部下载工具来代替默认的wget来给pacman提速
比如将/etc/pacman.conf中
XferCommand = /usr/bin/wget –passive-ftp -c -O %o %u
注释掉,同时添加
XferCommand = /usr/bin/axel -o %o %u
即可使用axel多线程下载工具
而要让yaourt也支持多线程,只需修改/etc/makepkg.conf

将’http::/usr/bin/wget -c -t 3 –waitretry=3 -O %o %u’改成了’http::/usr/bin/axel -o %o %u’ 
##############################################################################################

yaourt nvidia

#xfce4
thunar

#i3
pacman -S  vim xorg-twm xorg-xclock i3 dmenu feh dunst  networkmanager network-manager-applet lxappearance
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
