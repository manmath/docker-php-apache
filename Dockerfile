FROM ubuntu:20.04

MAINTAINER Man Math <man@web-essentials.co>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    git \
    apache2 \
    libapache2-mod-php7.4 \
    php7.4-cli \
    php7.4-json \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-soap \
    php7.4-sqlite3 \
    php7.4-xml \
    php7.4-zip \
    php7.4-intl \
    php-apcu \
    php-imagick \
    openssl \
    nano \
    jpegoptim \
    graphicsmagick \
    imagemagick \
    ghostscript \
    mysql-client \
    iputils-ping \
    nodejs \
    npm \
    locales \
    sqlite3 \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set ports
EXPOSE 80 443

# Set workdir to project root
WORKDIR /var/www/html

# Remove default html
RUN rm index.html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set locales
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 fr_FR.UTF-8 km_KH

# Enable apache modules
RUN a2enmod rewrite
RUN a2enmod ssl

# Configure PHP
ADD default.php.ini /etc/php/7.4/mods-available/2020-default.ini
RUN ln -s /etc/php/7.4/mods-available/2020-default.ini /etc/php/7.4/apache2/conf.d/
RUN ln -s /etc/php/7.4/mods-available/2020-default.ini /etc/php/7.4/cli/conf.d/

# Configure vhost
ADD default.vhost.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
