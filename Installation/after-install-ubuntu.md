# What to do after Ubuntu 22.04 Installation

```BASH

sudo apt update
sudo apt upgrade

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

sudo apt install git -y
git config --global user.email "devrimmehmet@gmail.com"
git config --global user.name "Devrim Mehmet Pattabanoğlu"
