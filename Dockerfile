FROM ubuntu
MAINTAINER mtyiu <mattmtyiu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	apache2 \
	curl \
	imagemagick \
	php5 \
	libapache2-mod-php5 \
	php5-mysql \
	python \
	python-mysqldb

# Add CGI support
COPY 000-default.conf /etc/apache2/sites-available/
RUN a2enmod cgi

# Install phpMyAdmin
RUN curl --location https://files.phpmyadmin.net/phpMyAdmin/4.5.3.1/phpMyAdmin-4.5.3.1-english.tar.gz | tar xzf - \
	&& mv phpMyAdmin* /etc/phpmyadmin \
	&& rm -rf /etc/phpmyadmin/js/jquery/src/ /etc/phpmyadmin/examples /etc/phpmyadmin/po/
RUN mkdir /etc/phpmyadmin/upload
RUN mkdir /etc/phpmyadmin/save
RUN chown -R www-data:www-data /etc/phpmyadmin

RUN echo "<?php \$cfg['blowfish_secret']='$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)'; ?>" > /etc/phpmyadmin/config.secret.inc.php
COPY config.inc.php /etc/phpmyadmin/

EXPOSE 80

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

