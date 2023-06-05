#!/bin/sh
rm wp-config.php
echo " Configuring Wordpress database...";
wp config create --dbhost=$MYSQL_HOST \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_USER_PASSWORD \
		--locale=$WORDPRESS_LOCALE \
		--skip-check

echo " Installing Wordpress...";
echo " With: $WORDPRESS_ADMIN_PASSWORD and $WORDPRESS_ADMIN_PASSWORD"
wp core install \
		--url=$WORDPRESS_WEBSITE_URL_WITHOUT_HTTP \
		--title="$WORDPRESS_WEBSITE_TITLE" \
		--admin_user=$WORDPRESS_ADMIN_PASSWORD \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=$WORDPRESS_ADMIN_EMAIL


echo " Configuring Wordpress settings...";
wp option update siteurl $WORDPRESS_WEBSITE_URL
wp option update home $WORDPRESS_WEBSITE_URL

echo " Activating Wordpress plugins...";

wp plugin install export-all-urls --activate 
