# Introduction

This is a docker container with php 7.2.8, php7-fpm, nginx 1.14.0, mariadb 10.2.15.

To build, clone the repo, cd into it and run:

`docker build -t palapa/php .`

To run the server, you could use the following command:

`docker run -it -p 80:80 -v "$PWD/app":/www palapa/php`
