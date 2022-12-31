FROM ubuntu:22.04

LABEL author="manmath4@gmail.com" verson="8.1" description="A flexible Docker image based on Ubuntu 22.04, Apache2 and PHP 8.1"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    git \
    apache2 \
    libapache2-mod-php8.1 \
    php8.1-cli \
    php8.1-common \
    php8.1-mysql \
    php8.1-zip \
    php8.1-gd \
    php8.1-mbstring \
    php8.1-curl \
    php8.1-xml \
    php8.1-bcmath \
    php8.1-fpm \
    php8.1-ldap \
    php8.1-soap \
    php8.1-sqlite3 \
    php8.1-intl \
    php8.1-xdebug \
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
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 ja_JP.UTF-8 zh_CN.UTF-8 fr_FR.UTF-8 km_KH

# Enable apache modules
RUN a2enmod rewrite
RUN a2enmod ssl

# Configure PHP
ADD default.php.ini /etc/php/8.1/mods-available/2023-default.ini
RUN ln -s /etc/php/8.1/mods-available/2023-default.ini /etc/php/8.1/apache2/conf.d/
RUN ln -s /etc/php/8.1/mods-available/2023-default.ini /etc/php/8.1/cli/conf.d/

# Configure vhost
ADD default.vhost.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
