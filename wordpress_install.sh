# wordpress installation and configuration file
# this is a startup file for a GCE machine to install wordpress, and have most of if configured
# up to the step where you actually open wordpress, and set passwords, and preferences. 
# wordpress here is not intended to serve the websites, but only manage, create, delete. Only Manage Content. 
# this script is based on https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview

# 1 - install dependencies
sudo apt update
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mariadb-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

# 2 -install wordpress from official website
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

# 3 - add wordpress config inside apache 
sudo touch /etc/apache2/sites-available/wordpress.conf
echo '<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
' | sudo tee /etc/apache2/sites-available/wordpress.conf

# 3.1 - enable website 
sudo a2ensite wordpress

# 3.2 - enable URL rewriting with
sudo a2enmod rewrite

# 3.3 - disable the default “It Works” site with:
sudo a2dissite 000-default

# 3.4 - reload apache2 to get the configs
sudo service apache2 reload

# configure mysql/mariadb database
sudo mysql -u root -e "CREATE DATABASE wordpress;CREATE USER wordpress@localhost IDENTIFIED BY '15101310'; GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;FLUSH PRIVILEGES;";

# configure wordpress to connect to the database
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

# set db name, pass, user
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/15101310/' /srv/www/wordpress/wp-config.php

# delete lines with placeholder content
for ((i=0; i<=8;i++))
do 
    sed -i "45d" wp-config.php
done

# change the configuration file to have randomized keys,
# this avoids some known attacks
# insert randomized content in the end of file
curl https://api.wordpress.org/secret-key/1.1/salt/ >> wp-config.php

# display and save external ip
dig +short myip.opendns.com @resolver1.opendns.com | tee my_ip

wp plugin install wp-stateless --activate
