#!/usr/bin/env bash

# ip -4 addr show wlp2s0|grep inet |awk -F ' ' '{ print substr($2,0,12)}'

if [ $# -gt 0 ]; then
  if [ "$1" == "start" ]; then
        docker-compose up -d
  elif [ "$1" == "stop" ]; then
      docker-compose down
  elif [ "$1" == "composer" ] || [ "$1" == "comp" ]; then
      shift 1;
        docker-compose exec \
                        app \
                        composer "$@"
  elif [ "$1" == "test" ]; then
      shift 1;
      docker-compose exec \
                      app \
                      ./vendor/bin/phpunit "$@"
  elif [ "$1" == "artisan" ] || [ "$1" == "art" ]; then
  ## If project is running artisan
      shift 1;
      docker-compose exec \
                      app \
                      php artisan "$@"
  elif [ "$1" == "yarn" ]; then
  ## If project is running artisan
      shift 1;
      docker-compose run --rm \
                      node \
                      yarn "$@"
  elif [ "$1" == "npm" ]; then
  ## If project is running artisan
      shift 1;
     docker-compose run --rm \
                      node \
                      npm "$@"
  else
     docker-compose "$@"
  fi
else
  docker-compose ps
fi