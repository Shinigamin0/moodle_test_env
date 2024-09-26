#!/bin/bash
echo "Version de php a instalar : $php_version"
apt update \
&& apt install -y \
php$php_version \
php$php_version-common \
php$php_version-mysql \
php$php_version-pgsql \
php$php_version-snmp \
php$php_version-ldap \
php$php_version-xml \
php$php_version-xmlrpc \
php$php_version-curl \
php$php_version-gd \
php$php_version-imagick \
php$php_version-cli \
php$php_version-dev \
php$php_version-imap \
php$php_version-mbstring \
php$php_version-opcache \
php$php_version-soap \
php$php_version-zip \
php$php_version-intl \
php$php_version-exif
apt-get clean
echo 'max_input_vars = 5000' >> /etc/php/$php_version/apache2/php.ini
