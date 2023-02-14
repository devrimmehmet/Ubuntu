# What to do after Ubuntu 22.04 Installation
## Before Starting
###### Run the commands below on the terminal screen. After your Ubuntu installation is complete, open the terminal and apply the following bash commands step by step in the terminal.
```BASH

sudo apt update
sudo apt upgrade

```
## Dock Panel Settings
```BASH

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

```
## Git Install
```BASH

sudo apt install git -y
git config --global user.email "devrimmehmet@gmail.com"
git config --global user.name "Devrim Mehmet Pattabanoğlu"

```

## Apache2 Install
```BASH

sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
mkdir /var/www/html/adminer
wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php

```
## MariaDB Install
```BASH

sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
sudo mysql_secure_installation

```

*~~myRootPassword~~*: ****
##### The password you enter while performing these operations is the root password. Do not forget to save.
```BASH

sudo mysql -u root -p
    create user 'dbadmin'@'localhost' identified by 'dbadmin';
    flush privileges;
    exit;
```
*~~myRootPassword:~~* ****
##### The password you enter while performing these operations is the root password. Do not forget to save.

## Install Some Featured Programs
```BASH

sudo apt install composer npm guake* pv meld vim axel net-tools caffein* vlc chromium-browser magic-wormhole gnome-sushi -y

```

## Visual Studio Code Install  [Source](https://linuxhint.com/install-visual-studio-code-ubuntu22-04/) 
```BASH

sudo apt install software-properties-common apt-transport-https wget -y
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y

sudo apt autoremove

```

## Php Install  [Source](https://tecadmin.net/how-to-install-php-on-ubuntu-22-04/)

### Installation for different versions of PHP
```BASH

sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php

sudo apt update
sudo apt upgrade

```

### Installing and using 2 different PHP versions

```BASH
sudo apt install php8.1-fpm php8.1-intl php8.1-imagick php8.1-dev php8.1-zip php8.1-curl php8.1-xmlrpc php8.1-sqlite3 php8.1-gd php8.1-mysql php8.1-mbstring php8.1-xml libapache2-mod-php8.1 -y

~~sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y~~

sudo a2enmod php8.1
sudo a2dismod php7.4
sudo service apache2 restart

```

### Setting PHP version for CLI
```BASH

sudo update-alternatives --config php
sudo update-alternatives --set php /usr/bin/php8.1

```

## Informations

- Program  `gnome-sushi`: previews file and folder contents with <kbd>space</kbd> (like on MacOS)
 - `sudo snap refresh`  When a snap update alert is received, all open programs are closed and this command is run

## OPTIONAL APPS
##### If you need the following applications, install them, you do not need to install applications that you do not understand.

### Take a screenshot
When the following command is connected to the Shift+PrintScreen key, the screenshot of the part of the screen we will select is saved to the disk when this key is pressed. [SOURCE](https://askubuntu.com/a/1405337)

- `sudo apt install gnome-screenshot`
- `sudo apt install xclip`


Next,
> Settings | Keyboard | Keyboard Shortcuts | View and Customize Shortcuts | Custom Shortcuts |
A new shortcut is defined from the menu. To save these screenshots in the pictures directory, enter the following code in the COMMAND part:

```BASH

sh -c 'gnome-screenshot -af /home/$USER/Pictures/$(date "+%Y.%m.%d-%H.%M.%S").png'


```
![Adding Keyboard Shortcut](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/Take-a-screenshot.png)
I suggest you try this command in terminal first and test if your user account has access permission. If there is no image saved in the pictures folder when you test the command in the terminal, your user account does not have permission to access, you can use the following command to allow it.

`sudo chmod ugo+rwx /home/$USER/Pictures/*`

If you consider removing it, you can use this code to block access again.

`sudo chmod ugo-rwx /home/$USER/Pictures/*`

### OBS Studio (Open Broadcaster Software) [Source](https://obsproject.com/download#linux)

- `_sudo add-apt-repository ppa:obsproject/obs-studio_`
- `_sudo apt update_`
- `_sudo apt install ffmpeg obs-studio_`

![OBS Studio](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/OBS.png)

### Kdenlive [Source](https://launchpad.net/~kdenlive/+archive/ubuntu/kdenlive-stable)

- `sudo add-apt-repository ppa:kdenlive/kdenlive-stable`
- `sudo apt update`

- `sudo apt install kdenlive`

![Kdenlive](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/Kdenlive.png)
### FileZilla [SOURCE](https://websetnet.net/tr/how-to-install-filezilla-on-ubuntu-20-10-transfer-files/)

```BASH

sudo apt update 
sudo apt upgrade
sudo add-apt-repository ppa:sicklylife/filezilla
sudo apt update 
sudo apt install filezilla

```

![FileZilla](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/filezilla.png)



