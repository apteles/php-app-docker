## Examples

Run command inside container:

`docker-compose exec app ls /var/www/html && composer -v`

With binary `develop`:

start container:

`./develop.sh start`

stop container:

`./develop.sh stop`

composer:

`./develop.sh composer -v`

artisan:

`./develop.sh artisan route:list`

phpunit:

`./develop.sh test`
