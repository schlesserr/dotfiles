ln -sf /usr/share/zoneinfo/America/Belem /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts

pacman -S grub reflector base-devel linux-headers  bluez bluez-utils pulseaudio openssh rsync reflector acpi acpi_call acpid tlp os-prober ntfs-3g terminus-font iwctl

pacman -S  nvidia nvidia-utils 

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable bluetooth
systemctl enable reflector.timer
systemctl enable fstrim.timer

useradd -m schlesser
echo schlesser:123 | chpasswd
usermod -aG schlesser

echo "schlesser ALL=(ALL) ALL" >> /etc/sudoers.d/schlesser


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
