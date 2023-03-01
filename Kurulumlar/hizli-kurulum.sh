# Sürücülerin (driver) güncel dosyalarını yükle
sudo ubuntu-drivers autoinstall

# GIT kurulumu ve ayarları
sudo apt install git -y
git config --global user.email "devrimmehmet@gmail.com"
git config --global user.name "Devrim Mehmet Pattabanoğlu"

# Apache kurulumu
sudo apt install apache2 apache2-utils -y
# Apache varsayılan dosyasını sil
sudo rm -f /var/www/html/index.html
# Sistem açıldığında apache servisini otomatik başlat
sudo systemctl enable apache2
# Apache servisini yeniden başlat
sudo service apache2 restart
# Aktif kullanıcıyı Apache'nin varsayılan grubuna ekle (www-data)
sudo adduser $USER www-data
# Apache'nin varsayılan dizinine aktif kullanıcıyı yetkilendir
sudo chown -R $USER:www-data /var/www/html/

# Adminer'in en son sürümünü kur
mkdir /var/www/html/adminer
wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php

# MySQL / MariaDB kurulumu
sudo apt install mariadb-server mariadb-client -y
# Sistem açıldığında MySQL servisini otomatik başlat
sudo systemctl enable mariadb
# MySQL servisini yeniden başlat
sudo service mariadb restart

# MySQL Root kullanıcısı için şifreyi değiştir
# sudo mysql_secure_installation
mysql --user="root" --password="" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"

# Sık kullanılan faydalı paketleri kur
sudo apt install npm guake* pv meld vim axel net-tools caffein* vlc chromium-browser magic-wormhole gnome-sushi curl gnome-shell-extension-manager software-properties-common apt-transport-https wget -y

# Sistem genelinde karakter set olarak UTF8 kullan
LC_ALL=C.UTF-8


# vscode kurulumu
## vscode için güvenilir depolara vscode'un kendi deposunu ve imzasını ekle
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
## Depolarda yer alan paketlerin güncel listesini indir
sudo apt update
## vscode paketini kur
sudo apt install code -y

# PHP  için güvenilir depolara PHP'nin kendi deposunu ekle
sudo add-apt-repository -y ppa:ondrej/php 
## Depolarda yer alan paketlerin güncel listesini indir
sudo apt update 

# PHP 7.4 Sürümünü kur
sudo apt install php7.4-fpm php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-pgsql php7.4-xml libapache2-mod-php7.4 -y

# PHP 8.1 Sürümünü kur
sudo apt install php8.1-fpm php8.1-intl php8.1-imagick php8.1-dev php8.1-zip php8.1-curl php8.1-xmlrpc php8.1-sqlite3 php8.1-gd php8.1-mysql php8.1-mbstring php8.1-pgsql php8.1-xml libapache2-mod-php8.1 -y

## PHP composer paketini kur
sudo apt install composer -y

# PHP 7.4'i devre dışı bırak
sudo a2dismod php7.4
# PHP 8.1'ü etkinleştir
sudo a2enmod php8.1
# Değişikliğin geçerli olabilmesi için apache servisini yeniden başlat
sudo service apache2 restart

# Dash to dock için ayarlar
## Bu kod, Dash to Dock'un varsayılan konumunu "ORTA ALT" olarak değiştirir.
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
## Bu kod, Dash to Dock'un içindeki arama çubuğunun varsayılan konumunu "SOL ALT" olarak değiştirir.
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
## Dock ünitesinde program simgesine tıklayınca küçült/büyült
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
## Dock ünitesinde program simgesinde tekeri çevirince pencelere arasında gezin
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

## Kurulum sonrasında varsa gereksiz paketleri temizle
sudo apt autoremove

echo "\n\n\n=== KURULUM TAMAMLANDI===\n\n\n"

echo "\n\n\n=== Bu Paketler Nuri Akman tarafından hazırlanmış Osman Kayı'ya ait repoya eklenmiş ve Devrim Mehmet Pattabanoğlu tarafından kişisel kullanım için düzenlenmiştir.===\n\n\n"
