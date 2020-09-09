# 🚀 PHP APP Docker

Build applications using docker with structure pre defined and run in any platform
(windows/linux/macOS). This project will help you to launch fast applications not matter
platform you use. You should just clone this repository and build amazing thing.

# Features
- docker-compose
- docker
- php latest (7.4.9)
- composer

## Using this project

This project provide a executable develop.sh, it provide the following commands to help you:


Run command inside container:

`docker-compose exec app composer config --list`

start container:

`./develop.sh start`

stop container:

`./develop.sh stop`

composer:

`./develop.sh composer -v`

artisan (if you are using lavel): 

`./develop.sh artisan route:list`


Remembering that the command related to docker you can fell free to run with `docker-compose` 

You can control some configurations with the file `.env-example`. To `docker-compose.yml` consider load
this file you must rename it to just `.env`. After do that you can run `./develop.sh up` and the docker-compose.yml
will load this configurations.

Contributing:

Please read our [Contributing Guide](./CONTRIBUTING.md) before submitting a Pull Request to the project.

## Licença

![LICENSE](https://img.shields.io/badge/license-MIT-%23F8952D)


