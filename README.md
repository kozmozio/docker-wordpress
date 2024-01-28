# Laravel API Project
kozmoz
72f0UfApxtLI2nm*#$

## Description
This project is a Laravel API that provides endpoints for interacting with a specific application.

NGINX_VERSION  : 1.24.0
PHP_VERSION    : 8.3-rc-alpine3.19
PG_VERSION     : postgres:16.1-alpine3.19  

## Table of Contents
- [Docker Setup](#Docker)
- [Laravel Appp Installation](#installation)



## Docker Compose Configuration 
 
 1. Build PHP Nginx Base image localy and serve 
  
  `docker build -f docker/php-nginx-base.Dockerfile -t kozmoz/php-nginx-base -t kozmoz/php-nginx-base:8.3 . --no-cache`
  * 8.3 refers to PHP Version 

 2. `bash build-dev.sh` file is a shortcut 
 3. `docker-compose.yml` file is used to define, configure, and run  multi-container Docker applications.
 
     -  `docker-compose -f docker-compose.yml build`
     -  `docker-compose -f docker-compose.yml up -d` 

 4. Build Laravel App Docker Image (Bağımsız build)

  ` docker build -f Dockerfile -t docker-wp-laravel -t docker-wp-laravel . --no-cache `


## Laravel App Installation
1. Clone the repository.
2. Install the dependencies by running `composer install`.
3. Create a copy of the `.env.example` file and rename it to `.env`.
4. Generate an application key by running `php artisan key:generate`.
5. Configure the database connection in the `.env` file.
6. Run the database migrations and seed the database by running `php artisan migrate --seed`.
7. Start the development server by running `php artisan serve`.

### Services
- `docker-wp-db`: This service is likely to be the database for the docker-wpapplication.

- `docker-wp-api` : This service appears to be similar to docker-wp-web, but it's likely intended to serve API requests, as suggested by the APP_MODE environment variable set to API. It also connects to the docker-wp-db database service and shares the application's source code with the container through a volume.

- `docker-wp-web`: This service seems to be a web application built with Laravel (a PHP framework).
 It connects to the docker-wp-db database service. The application's source code is shared with the container through a volume. The APP_MODE environment variable is set to WEB, suggesting this instance of the application is intended to serve web requests.

### Networks
- `docker-wp`: This is a custom network created for the services in this Docker Compose configuration. It uses the `bridge` driver, which is the default network driver for Docker. If you connect any services to this network, they will be able to communicate with each other.

## Usage

To start the application, navigate to the directory containing this file and run:

`bash build-dev.sh`

