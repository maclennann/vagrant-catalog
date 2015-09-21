#!/bin/bash

if [ "$1" == "test" ]; then
  docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:5.6-cli php vendor/bin/phpunit
elif [[ "$1" == "run" ]]; then
  docker build -t vagrant-catalog .
  docker run -it -p 8085:80 -v "$PWD":/var/www/html --rm --name vc vagrant-catalog
fi
