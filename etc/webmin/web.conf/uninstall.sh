#!/bin/sh
printf "Are you sure you want to uninstall Webmin? (y/n) : "
read answer
printf "\n"
if [ "$answer" = "y" ]; then
	/etc/webmin/web.conf/stop
	echo "Running uninstall scripts .."
	(cd "/srv/http/webmin" ; WEBMIN_CONFIG=/etc/webmin/web.conf WEBMIN_VAR=/var/webmin LANG= "/srv/http/webmin/run-uninstalls.pl")
	echo "Deleting /srv/http/webmin .."
	rm -rf "/srv/http/webmin"
	echo "Deleting /etc/webmin/web.conf .."
	rm -rf "/etc/webmin/web.conf"
	echo "Done!"
fi
