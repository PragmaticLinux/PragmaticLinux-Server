#!/bin/bash
# Author: Alban Mulaki
# Website: http://www.pragmaticlinux.org


echo "Clear Package Cache, Optimize Pacman"
pacman -Scc
pacman-optimize
updatedb

echo "Clear User & Root history,cache.."
rm -R /root/*



echo "Deleting Logs"
rm -R /var/log/vsftpd*
rm -R /var/log/pureftp*
truncate /var/log/pacman.log --size 0
rm -R /var/log/httpd/*
find /var/log/samba ! -type d -exec rm '{}' \;
find /var/log/journal ! -type d -exec rm '{}' \;


#Build Recompile
mkinitcpio -p linux
