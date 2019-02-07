#################################
## ARCH - LINUX BY:NIIL78       #
#################################
echo -e 'tienes que estar comnectado a internet.'
echo -e 'vamos a abrir los mirrors y pacman, por si tenemos que hacer cambios'
nano /etc/pacman.conf
nano /etc/pacman.d/mirrorlist
echo -e 'Efivars'
ls /sys/firmware/efi/efivars
sleep 5
echo -e 'Poniendo la hora'
timedatectl set-ntp true
timedatectl status
sleep 5
clear
echo -e 'Listamos los discos duros'
lsblk
echo -e 'Llego la hora de particionar'
echo -e '/dev/sda[120GB]'
echo -e '/dev/sda1 -> /boot[512M]'
echo -e '/dev/sda2 -> /swap[4G]'
echo -e '/dev/sda3 -> /root[50G]'
echo -e '/dev/sda4 -> /Home[resto]'
sleep 15
echo -e 'n (Crea una nueva partición)'
echo -e 'Dejar número de la partición por defecto, presionando ENTER'
echo -e 'Dejar por defecto el sector inicial, presionando ENTER'
echo -e 'Para el sector final, escribir +TAMAÑO y presionar ENTER'
echo -e 'Escribir TIPO cuando se pida código de partición y luego ENTER'
echo -e 'w (Para escribir los cambios y luego ENTER)'
echo -e 'y (Para aceptar los cambios y luego ENTER)'
sleep 10
echo -e '1º particion /boot[512M] TIPO: EF00 '
gdisk /dev/sda1
echo -e '2º particion /swap[4G] TIPO: 8200 '
gdisk /dev/sda2
echo -e '3º particion /root[50G] TIPO: 8304 '
gdisk /dev/sda3
echo -e '4º particion /home TIPO: 8302'
gdisk /dev/sda4
echo -e 'Listo Particionado finalizado'
lsblk
echo -e 'Formateando todas las particiones'
mkfs.fat -F32 /dev/sda1
echo -e '/boot - formateado'
mkswap /dev/sda2
echo -e '/swap - formateado'
swapon /dev/sda2
echo -e '/SWAP ON'
mkfs.ext4 /dev/sda3
echo -e '/root - formateado'
mkfs.ext4 /dev/sda4
echo -e '/home - formateado'
echo -e 'Formatos listos'
echo -e 'montando particiones'
mount /dev/sda3 /mnt
echo -e '/root - listo'
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
echo -e '/boot - listo'
mkdir -p /mnt/home
mount /dev/sda4 /mnt/home
echo -e '/home - listo'
echo -e 'recordamos que SWAP ya fue marcado ON'
sleep 5
clear
echo -e 'comenzamos proceso instalacion y configuracion basica'
sleep 2
pacstrap /mnt
echo -e 'Generar fstab'
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo -e 'Bienvenido a tu pequeña instalacion'
arch-chroot /mnt /bin/bash
tzselect
pacman -Syu grub efibootmgr iw wpa_supplicant dialog sudo
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
echo NStation > /etc/hostname
useradd -m pepe
passwd
echo -e 'configuracion basica minima lista'
exit
umount -R /mnt
swapoff /dev/sda2
reboot
