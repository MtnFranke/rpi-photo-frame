#!/bin/bash

# WIFI

export PORTAL_SSID="Bilderrahmen"
bash <(curl -L https://github.com/balena-io/wifi-connect/raw/master/scripts/raspbian-install.sh)

# DEACTIVATE CRONTAB

crontab -r

# HOUSEKEEPING

apt --fix-broken install
apt install curl -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2010%%20

apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
apt purge smartsim java-common minecraft-pi libreoffice* -y

apt clean
apt autoremove -y

apt update
apt upgrade -y
apt autoremove -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2020%%20

apt install curl xdotool unclutter sed git fbi python3-pip libatlas-base-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms1-dev libopenjp2-7 libtiff5 python-cffi python-cryptography python3-cffi python3-cryptography python3-numpy python3-pillow python3-dev -y

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2035%%20

# BOOTSTRAP

touch /boot/ssh
cd /home/pi || exit
git clone https://github.com/MtnFranke/rpi-photo-frame.git
timedatectl set-timezone Europe/Berlin

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2050%%20

# CONFIGURATIONS

cp /home/pi/rpi-photo-frame/conf/rc.local /etc/rc.local
chmod +x /etc/rc.local

curl http://localhost:5600/toast/Update%20l%C3%A4uft.%20Bitte%20nicht%20ausschalten.%20%2075%%20

# PHOTO FRAME

python3 -m pip install --upgrade pip
cd /home/pi/rpi-photo-frame || exit
python3 -m pip install -r requirements.txt --upgrade
python3 -m pip install gunicorn --upgrade

# REACTIVATE CRONTAB

curl http://localhost:5600/toast/Update%20abgeschlossen.%20Neustart...%20

/usr/bin/crontab /home/pi/rpi-photo-frame/cron/crontab

# PERMISSIONS

chmod -R 777 /home/pi/rpi-photo-frame

# SERVICE

cp /home/pi/rpi-photo-frame/scripts/kiosk.service /lib/systemd/system/kiosk.service
systemctl daemon-reload
systemctl enable kiosk.service

# SPLASH

cd /home/pi/rpi-photo-frame/doc/ || exit
wget https://www.datenwissenschaften.com/resources/splash.png
cp /home/pi/rpi-photo-frame/doc/splash.png /usr/share/plymouth/themes/pix/splash.png

# GUI

rm /etc/xdg/autostart/piwiz.desktop
cp /home/pi/rpi-photo-frame/conf/autostart /etc/xdg/lxsession/LXDE-pi/autostart
cp /home/pi/rpi-photo-frame/conf/desktop-items-0.conf /etc/xdg/pcmanfm/LXDE-pi/desktop-items-0.conf
cp /home/pi/rpi-photo-frame/conf/01-disable-update-check /etc/chromium-browser/customizations/01-disable-update-check

# REBOOT

/sbin/shutdown -r -f
