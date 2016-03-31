#!/bin/sh
printf "Are you sure you want to uninstall Webmin? (y/n) : "
read answer
printf "\n"
if [ "$answer" = "y" ]; then
	/etc/webmin/webmin.conf/stop
	echo "Running uninstall scripts .."
	(cd "/srv/http/webmin" ; WEBMIN_CONFIG=/etc/webmin/webmin.conf WEBMIN_VAR=/var/webmin LANG= "/srv/http/webmin/run-uninstalls.pl")
	echo "Deleting /srv/http/webmin .."
	rm -rf "/srv/http/webmin"
	echo "Deleting /etc/webmin/webmin.conf .."
	rm -rf "/etc/webmin/webmin.conf"
	echo "Done!"
fi
