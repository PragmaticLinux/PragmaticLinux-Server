#!/bin/bash
# Author: Alban Mulaki
# Website: http://www.pragmaticlinux.org


echo "Clear Package Cache, Optimize Pacman"
pacman -Scc
pacman-optimize
updatedb

echo "Clear User & Root history,cache.."
#rm -R /root/*



echo "Deleting Logs"
#rm -R /var/log/vsftpd*
#rm -R /var/log/pureftp*
truncate /var/log/pacman.log --size 0
#rm -R /var/log/httpd/*
find /root -exec rm -R '{}' \;
find /var/log/vsftpd ! -type d -exec rm -R '{}' \;
find /var/log/pureftp ! -type d -exec rm -R '{}' \;
find /var/log/httpd ! -type d -exec rm -R '{}' \;
find /root/ -exec rm -R '{}' \;
find /var/log/samba ! -type d -exec rm '{}' \;
find /var/log/journal ! -type d -exec rm '{}' \;
find /srv/ ! -type d -name ".*" -exec rm '{}' \;
truncate /srv/error_log --size 0
truncate /srv/http/error_log --size 0
truncate /srv/http/access_log --size 0

#Build Recompile
mkinitcpio -p linux

mkdir /root
