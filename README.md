
# Docker WordPress Development & Production Envrionment Nginx, PHP-fpm, MySQL, PhpmyAdmin 

This Docker Compose configuration provides a setup for running WordPress,PHP-fpm  MySQL, Nginx, and PHPMyAdmin using Docker containers.

Build for easy development and production setups, also possible to use in production with some tweaks.

 - mysql:8.0
 - nginx:1.25.3-alpine
 - wordpress:6.4.3-php8.1-fpm-alpine
 - phpmyadmin:5.2.1

## Cmopiled Docker Image is here : 

- [kozmozio/wordpress](https://hub.docker.com/repository/docker/kozmozio/wordpress/general)


## Containers
- [Install Docker](https://docs.docker.com/get-docker/)
- [Kozmoz Wordpress Base Image](https://hub.docker.com/repository/docker/kozmozio/wordpress/general)
- [Wordpress Base Image](https://github.com/docker-library/wordpress/tree/ac65dab91d64f611e4fa89b5e92903e163d24572/latest/php8.2/fpm-alpine)
- [MySQL](https://hub.docker.com/_/mysql)
- [Phpmyadmin](https://hub.docker.com/_/phpmyadmin)
- [Nginx](https://hub.docker.com/_/nginx)

## Services
- `db`: MySQL 
- `wordpress` : Wordpress
- `nginx`: NGINX Proxy Server
- `phpmyadmin`: NGINX Proxy Server

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/kozmozio/docker-wordpress.git
    cd your-repository
    ```

2. Create a `.env` file with the required environment variables:

    ```
    NAMESPACE=your_project_name

    MYSQL_DATABASE=your_db_name
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_USER=your_db_user
    MYSQL_PASSWORD=your_db_password

    WORDPRESS_DB_HOST=db
    WORDPRESS_DB_USER=your_wp_user
    WORDPRESS_DB_PASSWORD=your_wp_password
    WORDPRESS_DB_NAME=your_wp_db_name
    WORDPRESS_DEBUG=true
    WORDPRESS_TABLE_PREFIX=wp_
    # WP_DEBUG=debug

    ```

 3. `bash build-dev.sh` file is a shortcut 
      - `docker build -f Dockerfile -t kozmozio/wordpress:6.4.3 -t kozmozio/wordpress:6.4.3 . --no-cache`

 4. Push to Dockker Hub (optional)
   - `docker tag kozmozio/wordpress:6.4.3 kozmozio/wordpress:6.4.3`
   - `docker push kozmozio/wordpress:6.4.3`
 
 5. Docker Compose UP!
     -  `docker-compose.yml` file is used to define, configure, and run  multi-container Docker applications.
     -  `docker-compose -f docker-compose.yml build`
     -  `docker-compose -f docker-compose.yml up -d` 

6. Access WordPress:

    - Add your domain to your hosts file via terminal
      - `sudo pico etc hosts`
      - Add : `127.0.0.1   docker-wp.local`
    - Open your browser and navigate to http://docker-wp.local


6. Access PHPMyAdmin:

    - Open your browser and navigate to http://localhost:8000
    - Use the MySQL credentials specified in the `.env` file.

## Additional Configuration

- **.env-sample:**
  - Name it to `.env` and save in project root.

- **Nginx Configuration:**
  - Nginx configuration can be customized by modifying `./docker/nginx.conf`.

- **Dockerfile:**
  - Customise your hosting environment config and defaults
  
- **docker-compose.yml:**

      `volumes:
      - ./wordpress:/var/www/html
      - ./themes/twentytwentyfour:/var/www/html/wp-content/themes/twentytwentyfour
      - ./plugins:/var/www/html/wp-content/plugins
      - ./uploads:/var/www/html/wp-content/uploads`


## Services
- `db`: MySQL 
- `wordpress` : Wordpress
- `nginx`: NGINX Proxy Server
- `phpmyadmin`: NGINX Proxy Server

## Networks
- `docker-wp-net`: This is a custom network created for the services in this Docker Compose configuration. It uses the `bridge` driver, which is the default network driver for Docker. If you connect any services to this network, they will be able to communicate with each other.

## Usage

To start the application, navigate to the directory containing this file and run:

`bash build-dev.sh`

## Troubleshooting

- If you encounter issues, check the logs:
  ```bash
  docker-compose logs -f

## Debian Host Hestia Control Panel 
  - Change domainconfig file  redirecting your container port
  /etc/nginx/conf.d/domains

 /home/kozmoz/conf/web/blog.samplr.io/nginx.ssl.conf
 /home/kozmoz/conf/web/loop.samplr.io/nginx.ssl.conf

 ### Blog.samplr.io Cert Files Locatin Hesita server
/home/kozmoz/conf/web/blog.samplr.io
/home/kozmoz/conf/web/blog.samplr.io/ssl/blog.samplr.io.pem;
/home/kozmoz/conf/web/blog.samplr.io/ssl/blog.samplr.io.key;
/home/kozmoz/conf/web/blog.samplr.io/ssl/blog.samplr.io.ca;
/home/kozmoz/conf/web/blog.samplr.io/ssl/blog.samplr.io.crt;

/usr/local/hestia/data/templates/web/nginx/docker.tpl ve .sptl
/usr/local/hestia/data/templates/web/nginx/docker.stpl

## Prompts

You are a devops engineer, tou task is to make live production ready wordpress website inside ddokcer php-fpm enviroment, mysql database and nginx proxy server , hosted in Hestia control panel under another nginx server.

Currently containers are up and running but SSL is not workikng 