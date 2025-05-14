# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:latest

# RUN apt-get update && apt-get install -y magic-wormhole

# RUN echo "Listen 0.0.0.0:80" >> /etc/apache2/ports.conf

# Expose port 10000
EXPOSE 10000

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data
