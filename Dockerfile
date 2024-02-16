# Use an intermediate image for building
FROM wordpress:6.4.3-php8.1-fpm-alpine as builder
# ... install dependencies, build your application ...

# Then copy the built application to the final image
FROM wordpress:6.4.3-php8.1-fpm-alpine


# add custom php-fpm pool settings, these get written at entrypoint startup
ENV FPM_PM_MAX_CHILDREN=20 \
    FPM_PM_START_SERVERS=2 \
    FPM_PM_MIN_SPARE_SERVERS=1 \
    FPM_PM_MAX_SPARE_SERVERS=3

# install necessary alpine packages need for WP PHP 
RUN apk update  
RUN apk add nano 
RUN apk add curl-dev
RUN apk add dos2unix 
RUN apk add libxml2-dev 
RUN apk add dos2unix 


#Enabling PHP extensions
# RUN docker-php-ext-install xml
# RUN docker-php-ext-install dom
# RUN docker-php-ext-install mbstring
# RUN docker-php-ext-install session
RUN docker-php-ext-install curl


# # set composer related environment variables
# ENV PATH="/composer/vendor/bin:$PATH" \
#     COMPOSER_ALLOW_SUPERUSER=1 \
#     COMPOSER_HOME=/composer \
#     COMPOSER_VENDOR_DIR=/var/www/docker-wp/vendor  

# # install composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
#     && composer --ansi --version --no-interaction

# Install Wordpress CLI (optional)
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	&& chmod +x wp-cli.phar \
# 	&& mv wp-cli.phar /usr/local/bin/wp



# RUN dos2unix /usr/local/bin/docker-wordpress-entrypoint.sh
# RUN dos2unix /usr/bin/docker-wp-entrypoint

# copy NGINX configuration
# COPY ./docker/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx.conf /etc/nginx/conf.d/default.conf

# COPY ./docker/docker-wp.conf /etc/nginx/sites-enabled/docker-wp.conf

# copy application code
WORKDIR /var/www/html
VOLUME wordpress

# Copy wp-config.php 
COPY  ./docker/wp-config-docker.php /var/www/html/wp-config.php
RUN  chown www-data:www-data /var/www/html/wp-config.php

# HTACCESS

# VOLUME /var/www/html

# copy entrypoint files
COPY ./docker/docker-wordpress-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-wordpress-entrypoint.sh"]

EXPOSE 80

# run php-fpm
CMD ["php-fpm"]