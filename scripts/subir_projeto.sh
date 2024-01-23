#!/bin/bash
# echo -e "Listando Projetos\033[01;31m\033[00;37m"
DIR='/var/www/html'
ls $DIR/
read -p "Informe o nome do projeto: " PROJETO
cd $DIR/$PROJETO/ && composer install
cd $DIR/$PROJETO/ && php artisan key:generate
chmod -R 775 $DIR/$PROJETO 
chmod -R 775 $DIR/$PROJETO/storage/
chown -R 1001:1001 $DIR/$PROJETO 
chown -R www-data:www-data $DIR/$PROJETO/storage
ls -l $DIR/$PROJETO
cd $DIR/$PROJETO/ && php artisan config:cache && php artisan route:cache
