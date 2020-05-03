#!/bin/bash

# DEACTIVATE CRONTAB

crontab -r

# STATUS MESSAGE

apt install curl -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2010%%20

# MIGRATION

apt purge nodejs -y
chmod +x /usr/local/bin/uninstall-log2ram.sh && sudo /usr/local/bin/uninstall-log2ram.sh
apt purge plymouth -y
apt purge profile-sync-daemon -y
apt purge python* -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2030%%20

# BOOTUP

systemctl disable plymouth-start.service
systemctl disable dphys-swapfile.service
systemctl disable keyboard-setup.service
systemctl disable apt-daily.service
systemctl disable wifi-country.service
systemctl disable hciuart.service
systemctl disable raspi-config.service
systemctl disable triggerhappy.service

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2040%%20

# CONFIGURATIONS

cp /home/pi/rpi-photo-frame/conf/rc.local /etc/rc.local
chmod +x /etc/rc.local
cp /home/pi/rpi-photo-frame/conf/config.txt /boot/config.txt

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2050%%20

# HOUSEKEEPING

apt update
apt upgrade -y
apt autoremove -y
apt autoclean -y

apt purge wolfram-engine -y
apt purge libreoffice* -y
apt clean -y
apt autoremove -y

apt install deborphan -y
apt autoremove --purge libx11-.* lxde-.* raspberrypi-artwork xkb-data omxplayer penguinspuzzle sgml-base xml-core alsa-.* cifs-.* samba-.* fonts-.* desktop-* gnome-.* -y
apt autoremove --purge "$(deborphan)" -y
apt autoremove --purge -y
apt autoclean -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2070%%20

# MINIMAL UI

apt install fbi -y
apt install midori matchbox -y
apt install chromium-browser -y
apt install unclutter -y
apt install git -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2075%%20

# PYTHON DEV PACKAGES

apt install libjpeg-dev -y
apt install zlib1g-dev -y
apt install libfreetype6-dev -y
apt install liblcms1-dev -y
apt install libopenjp2-7 -y
apt install libtiff5 -y
apt install libffi-devel -y
apt install python-cffi python-cryptography -y
apt install python3-cffi python3-cryptography python3-numpy python3-pillow python3-dev -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2080%%20

# ENSURE DATAPLICITY

if [ "$HOSTNAME" = image-frame-master-slf ]; then
    curl -s https://www.dataplicity.com/sopukyyq.py | sudo python
fi

if [ "$HOSTNAME" = image-frame-slf ]; then
    curl -s https://www.dataplicity.com/sopukyyq.py | sudo python
fi

# PHOTO FRAME

python3.5 -m pip install --upgrade pip
cd /home/pi/rpi-photo-frame || exit
python3.5 -m pip install -r requirements.txt --upgrade
python3.5 -m pip install gunicorn --upgrade

# REACTIVATE CRONTAB

curl http://localhost:5600/toast/Update%20abgeschlossen.%20Neustart...%20

/usr/bin/crontab /home/pi/rpi-photo-frame/cron/crontab

# REBOOT

/sbin/shutdown -r -f