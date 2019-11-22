FROM wordpress:latest

# Stop PHP caching behaviour
RUN rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini
