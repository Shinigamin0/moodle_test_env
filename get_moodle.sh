#!/bin/bash

echo "Version de moodle a descargar : $moodle_version"

moodle_direct_link="https://download.moodle.org/download.php/direct/stable"$moodle_version"/moodle-latest-"$moodle_version".tgz"

wget $moodle_direct_link -O moodle.tgz
tar -xvf moodle.tgz

if [ -d /var/www/html ];
then
    mv /var/www/html /var/www/html_old
    mv moodle /var/www/html
fi

echo "<?php phpinfo( ); ?>" >> /var/www/html/info.php
chmod +x /var/www/html/info.php

if [ ! -d /moodledata ];
then
    mkdir /moodledata
fi

chown -R www-data:www-data /var/www/html/
chown -R www-data:www-data /moodledata/
chmod -R 755 /var/www/html/
chmod -R 755 /moodledata/