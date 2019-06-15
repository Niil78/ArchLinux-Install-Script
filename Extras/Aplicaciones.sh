#KDE PLASMA
pacman -Syu --noconfirm plasma plasma-meta sddm
systemctl enable sddm
#systemctl restart sddm
#Descomentar si se usa tras la instalacion y no durante.
##
##BASICAS
pacman -S iw wpa_supplicant dialog vim sudo
##
# Aqui van algunas aplicaciones que suelo utilizar.
# Gestores de paquetes comprimidos
echo -e 'Gestores de paquetes y carptas'
sudo pacman -Syyu --noconfirm p7zip unrar tar rsync ark  thunar
sleep 4
clear
# Arduino y otras herramientas
echo -e 'Arduino y otras herramientas'
sudo pacman -S --noconfirm notepadqq mtpfs kio-mtp atom arduino arduino-builder arduino-docs arduino-cli arduino-ctags arduino-avr-core
sleep 4
echo -e 'Bluetooth y otras'
sudo pacman -S --noconfirm bluez bluedevil bluez-utils pulseaudio-bluetooth
clear
# Herramientas basicas
echo -e 'Herramientas basicas'
sudo pacman -S --noconfirm terminator screen filezilla atom ksystemlog libreoffice firefox opera rclone iptraf-ng kdeconnect
sudo pacman -S --noconfirm weechat teamspeak openvpn inkscape ardour pacmatic arpwatch ntop htop tcpdump steghide
sudo pacman -S --noconfirm john nmap tor veracrypt lynis ettercap-gtk hydra nikto sqlmap ifuse aircrack-ng wireshark-gtk teamviewer
sudo pacman -S --noconfirm kdesdk-thumbnailers kdf sweeper cbatticon

sleep 4
clear
# 3D printer
sudo pacman -S --noconfirm cura curaengine cura-binary-data
sleep 4
clear
echo -e 'finalizado'