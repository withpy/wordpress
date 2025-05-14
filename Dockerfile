FROM wordpress:latest

# Install only what's needed (avoid bloat)
RUN apt-get update && apt-get install -y \
    magic-wormhole \
    curl \
    less \
    vim \
 && rm -rf /var/lib/apt/lists/*

# Enable performance-related Apache modules
RUN a2enmod rewrite headers expires deflate

# Optimize Apache config for low latency
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
 && echo "Listen 0.0.0.0:10000" >> /etc/apache2/ports.conf

# Add PHP performance tuning (OPcache + memory limit)
COPY zz-performance.ini /usr/local/etc/php/conf.d/

# Ensure proper file ownership for WordPress
RUN chown -R www-data:www-data /var/www/html

EXPOSE 10000

USER www-data:www-data
