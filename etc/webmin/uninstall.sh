#!/bin/sh
printf "Are you sure you want to uninstall Webmin? (y/n) : "
read answer
printf "\n"
if [ "$answer" = "y" ]; then
	/etc/webmin/stop
	echo "Running uninstall scripts .."
	(cd "/srv/http/webmin" ; WEBMIN_CONFIG=/etc/webmin WEBMIN_VAR=/var/log/webmin LANG= "/srv/http/webmin/run-uninstalls.pl")
	echo "Deleting /srv/http/webmin .."
	rm -rf "/srv/http/webmin"
	echo "Deleting /etc/webmin .."
	rm -rf "/etc/webmin"
	echo "Done!"
fi
