#!/bin/bash
source ./conf

docker exec -it $moodle_app_container_name /bin/bash -c \
    /usr/bin/php /var/www/html/admin/cli/install.php \
    --lang=en --wwwroot=http://localhost \
    --dataroot=$moodle_data_directory \
    --dbhost=$moodle_db_container_name \
    --dbname=$moodle_db_name \
    --dbuser=$moodle_db_user \
    --dbpass=$moodle_db_password \
    --dbport="3306" \
    --fullname=$moodle_name \
    --shortname=$moodle_name \
    --summary=$moodle_name \
    --adminuser="administrator" \
    --adminpass="Administrator-1" \
    --adminemail="admin@admin.com" \
    --non-interactive --agree-license

docker exec -it $moodle_app_container_name /bin/bash -c '/home/ubuntu/set_permissions.sh'



