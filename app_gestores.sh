echo -e 'Instalacion dependencias previas'
pacman -Qg base-devel
sleep 1
pacman -S --noconfirm git base-devel
echo -e 'Vamos a instalar unos gestores de paquetes'
echo -e 'Funcionan exactamente igual que pacman'
echo -e 'Puedes instalar paquetes desde AUR mas facil'
sleep 5

#
# YAY GESTOR AYUDANTE DE PACMAN
# https://wiki.archlinux.org/index.php/AUR_helpers_(Espa%C3%B1ol)
echo -e 'Comenzamos la descarga de YAY y su instalacion'
sleep 1
git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
yay -Syu
cd ..
echo -e 'Yay instalado correctamente'
sleep 4
clear
#(Utilizo Tambien Pakku por que suele dar menos problemas con las llaves gpg)
# PAKKU GESTOR AYUDANTE DE PACMAN
# https://github.com/kitsunyan/pakku
git clone https://aur.archlinux.org/pakku.git
cd pakku
sudo makepkg -si
pakku -Syu
cd ..
echo -e 'Pakku instalado correctamente'
sleep 4
clear
rm -rf yay pakku
echo -e 'Finalizado'
