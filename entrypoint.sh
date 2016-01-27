#!/bin/bash

# Reset phpMyAdmin secret
echo "<?php \$cfg['blowfish_secret']='$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)'; ?>" > /etc/phpmyadmin/config.secret.inc.php

# Fix Apache permission
uid=$(stat -c %u /var/www/html)
mv /etc/apache2/envvars /etc/apache2/envvars.bak
grep -v 'APACHE_RUN_USER' /etc/apache2/envvars.bak > /etc/apache2/envvars
if [ $uid -ge 1000 ]; then
	adduser --system --uid=$uid owner
	echo 'export APACHE_RUN_USER=owner' >> /etc/apache2/envvars
else
	echo 'export APACHE_RUN_USER=www-data' >> /etc/apache2/envvars
fi

# Start Apache server
/usr/sbin/apache2ctl -DFOREGROUND

