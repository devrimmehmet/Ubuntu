
# Ubuntu 22.04 kurulumu bittikten sonra kurulacaklar
######  Aşağıdaki komutları terminal ekranında çalıştırınız. Ubuntu kurulumunuz tamamlandıktan sonra uçbirimi açıp aşağıdaki bash komutlarını terminalde adım adım uygulayarak yükleme işlemlerini yapınız atlama yapmayınız.

## Başlamadan Önce
```BASH

######  Bu komutu, sisteminizdeki paketleri kullandığınız dağıtımdaki programların güncel sürümlerine yükseltmek veya tümüyle yeni bir Debian sürümüne yükseltme yapmak amacıyla kullanabilirsiniz.
sudo apt update

######  Güncel debian distrolarında (bkz: sudo apt upgrade) olarak verilmesi de mubah olan sistem güncelleme komutudur.
sudo apt upgrade

```
## Başlat çubuğu olarak anılan Dock Panelle ilgili
```BASH
######  Uygulamaları simge durumuna küçültebilmenizi sağlar.
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

######  Uygulamalar arasında scrool tuşu (farenin tekerlek tuşu) ile geçiş yapabilmenizi sağlar.
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

```
## Git Kurulumu
```BASH

######  Git paketini kurar. '-y' ise size soru sormadan herşeye onay vermesi için eklenir.
sudo apt install git -y

######  Git için email adresi belirlemenizi sağlar.
git config --global user.email "devrimmehmet@gmail.com"

######  Git için isminizi belirlemenizi sağlar.
git config --global user.name "Devrim Mehmet Pattabanoğlu"

```

## Apache2 Kurulumu
```BASH
######  Apache2 paketinin kurulumunu yapar.
sudo apt install apache2 apache2-utils -y

######  Apache2 için varsayılan dizindeki index.html dosyasını siler.
sudo rm -f /var/www/html/index.html

###### Apache2'nin sistem başlangıcında kendiliğinden açılmasını istiyorsanız bu komutu kullanın.
sudo systemctl enable apache2

###### Apache2'nin yeniden başlamasını sağlar.
sudo service apache2 restart

###### Kullanıcı hesabınızı www-data grubuna ekler.
sudo adduser $USER www-data

###### Kullanıcı hesabınızı ve www-data grubunu ilgili dizin için yönetici yapar.
sudo chown -R $USER:www-data /var/www/html/

###### İlgili dizine html ve adminer klasörünü ekler.
mkdir /var/www/html/adminer

###### İlgili dizine adminer'in son sürümünü index.php adında yükler.
wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php

```
## MariaDB Kurulumu [Kaynakça](http://www.yucelalkan.com/ubuntu-mysql-yapilandirmasi)

```BASH

###### MariaDB kurulumunu yapar.
sudo apt install mariadb-server mariadb-client -y

###### MariaDB servislerini bilgisayar açıldığında çalışmasını sağlar.
sudo systemctl enable mariadb

###### MariaDB servislerini yeniden başlatır.
sudo service mariadb restart

###### MariaDB XXXXXXXXXXXXXXXXXXX 
sudo mysql_secure_installation

```
###### Bu işlemleri yaparken girdiğiniz şifre root şifresidir. Kaydetmeyi unutmayınız. 
*~~myRootPassword~~*: ****

```BASH

###### Mysql kullanıcı şifresi değiştirme
sudo mysql -u root -p

###### Mysql portalına geçtiğiniz için aşağıdaki komutu topluca çalıştırıp en son exit ile çıkış yapabilirsiniz.
    create user 'dbadmin'@'localhost' identified by 'dbadmin';
    flush privileges;
    exit;
```
###### Bu işlemleri yaparken girdiğiniz şifre root şifresidir. Kaydetmeyi unutmayınız. 
*~~myRootPassword:~~* ****

## Bazı Uygulamaları topluca kurma
```BASH
###### Aşağıdaki komuttaki install'dan sonra geçen her bir anahtar kelime kurulacak program ismidir. '-y' ise size onay sormadan kurmanızı sağlar.
sudo apt install composer npm guake* pv meld vim axel net-tools caffein* vlc chromium-browser magic-wormhole gnome-sushi -y

```

## Visual Studio Code Kurulumu  [Kaynakça](https://linuxhint.com/install-visual-studio-code-ubuntu22-04/) 
```BASH

sudo apt install software-properties-common apt-transport-https wget -y
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y

sudo apt autoremove

```

## Php Kurulumu  [Kaynakça](https://tecadmin.net/how-to-install-php-on-ubuntu-22-04/)

### Farklı sürümlerdeki PHP'leri Kurma
```BASH

sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https
LC_ALL=C.UTF-8
sudo add-apt-repository ppa:ondrej/php

sudo apt update
sudo apt upgrade

```

### 2 Farklı PHP versiyonu kurma

```BASH
sudo apt install php8.1-fpm php8.1-intl php8.1-imagick php8.1-dev php8.1-zip php8.1-curl php8.1-xmlrpc php8.1-sqlite3 php8.1-gd php8.1-mysql php8.1-mbstring php8.1-xml libapache2-mod-php8.1 -y

~~sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-xml libapache2-mod-php7.4 -y~~

sudo a2enmod php8.1
sudo a2dismod php7.4
sudo service apache2 restart

```

### PHP için CLI ayarları
```BASH

sudo update-alternatives --config php
sudo update-alternatives --set php /usr/bin/php8.1

```
### Bilgiler
- `gnome-sushi` Programı: <kbd>space</kbd> (boşluk çubuğu) tuşu ile dosya ve klasör içeriğinin önizlemesini gösterir (MacOS'daki gibi)
- `sudo snap refresh` Snap güncelleme uyarısı alındığında, açık tüm programlar kapatılır ve bu komut çalıştırılır


## İSTEĞE BAĞLI UYGULAMALAR
###### Aşağıdaki Uygulamaları ihtiyacınız varsa yükleyiniz ne olduğunu anlamadığınız uygulamaları yüklemenize gerek yok.


### Ekran Alıntısı Aracı

Shift+PrintScreen tuşuna aşağıdaki komut bağlanınca, bu tuşa basıldığında ekranın seçeceğimiz kısmın ekran görüntüsü diske kaydedilir. KAYNAK: https://askubuntu.com/a/1405337

- `sudo apt install gnome-screenshot`
- `sudo apt install xclip`

Ardından, 
> Ayarlar | Klavye | Klavye Kısayolları | Kısayolları Gör ve Özelleştir | Özel Kısayollar | 
menüsünden yeni kısayol tanımlanır. Resimler dizinine bu ekran görüntülerini kaydetmek için KOMUT kısmına aşağıdaki kod girilir: 

`sh -c 'gnome-screenshot -af /home/$USER/Resimler/$(date "+%Y.%m.%d-%H.%M.%S").png'`

![Klavye Kısayolu Ekleme](https://github.com/HayatOkulum/Archive/blob/main/Images/2023.02.08-00.08.24.png)

Bu komutu önce terminalde deneyip kullanıcı hesabınızın erişim izni varmı test etmenizi öneriririm. Komutu terminalde test ettiğinizde resimler klasörüne görüntü kaydedilmemişse kullanıcı hesabınızın erişim izni yoktur, izin vermek için aşağıdaki komutu kullanabilirsiniz.

`sudo chmod ugo+rwx /home/$USER/Resimler/*`

Kaldırmayı düşünürseniz tekrar erişim engellemek için bu kodu kullanabilirsiniz.

`sudo chmod ugo-rwx /home/$USER/Resimler/*`

### OBS Studio (Open Broadcaster Software) Kurulumu [Kaynakça](https://obsproject.com/download#linux)

- `_sudo add-apt-repository ppa:obsproject/obs-studio_`
- `_sudo apt update_`
- `_sudo apt install ffmpeg obs-studio_`

![OBS Studio](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/OBS.png)

### Kdenlive Kurulumu [Kaynakça](https://launchpad.net/~kdenlive/+archive/ubuntu/kdenlive-stable)

- `sudo add-apt-repository ppa:kdenlive/kdenlive-stable`
- `sudo apt update`

- `sudo apt install kdenlive`

![Kdenlive](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/Kdenlive.png)
### FileZilla Kurulumu [Kaynakça](https://websetnet.net/tr/how-to-install-filezilla-on-ubuntu-20-10-transfer-files/)

```BASH

sudo apt update 
sudo apt upgrade
sudo add-apt-repository ppa:sicklylife/filezilla
sudo apt update 
sudo apt install filezilla

```
![FileZilla](https://raw.githubusercontent.com/devrimmehmet/Ubuntu/main/Images/filezilla.png)
