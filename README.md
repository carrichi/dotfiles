# My Linux Configuration

COMANDOS PARA GRUB
=====================
El archivo de configuracion es: /etc/default/grub
  Aqui es donde se agregan las variables.

Agregar las siguientes variables:
GRUB_THEME="/usr/share/grub/themes/<nombre del tema>/theme.txt"
  Si se requiere cambiar el contenido del menu o modificarlo es en el archivo anterior.
GRUB_GFXMODE=1366x768
GRUB_GFXPAYLOAD_LINUX=keep

xrandr = Muestra las dimensiones de los monitores.

El comando para guardar los cambios es: sudo grub-mkconfig -o /boot/grub/grub.cfg
  Si se requiere eliminar opciones del grub en general se debe modificar el archivo grub.cfg

COMANDO PARA DESCOMBRIMIR TAR
==============================
Para .tar.xz
tar -Jxvf archivo.tar.xz


APPS
==============================
alacritty
nvim
git
scrot
amixer
yay
firefox
htop
zoom
brave
dolphin/thunar/ranger
gwenview/eog
java
vcl
node
rpm
google-chrome
sublime-text
visual-studio-code-bin
virtualbox
gimp
ulauncher
libreoffice
spectacle
