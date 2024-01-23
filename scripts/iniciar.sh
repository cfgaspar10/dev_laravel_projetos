#!/bin/bash
chown -R www-data:www-data /var/www/html/depenacesso/
cd /var/www/html/depenacesso/
composer install && composer update
npm install && npm run build
php artisan key:generate && php artisan config:cache && php artisan route:cache && php artisan storage:link