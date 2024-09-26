
#!/bin/bash
apt update \
&& apt install -y apache2 
apt-get clean
echo "<?php phpinfo( ); ?>" >> /var/www/html/info.php
chmod +x /var/www/html/info.php