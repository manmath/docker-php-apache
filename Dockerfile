FROM ubuntu:24.10

LABEL author="manmath4@gmail.com" verson="8.3" description="A flexible Docker image based on Ubuntu 24.04, Apache2.4 and PHP 8.3"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    git \
    apache2 \
    libapache2-mod-php8.3 \
    php8.3-cli \
    php8.3-common \
    php8.3-mysql \
    php8.3-pgsql \
    php8.3-zip \
    php8.3-gd \
    php8.3-mbstring \
    php8.3-curl \
    php8.3-xml \
    php8.3-bcmath \
    php8.3-fpm \
    php8.3-ldap \
    php8.3-soap \
    php8.3-sqlite3 \
    php8.3-intl \
    php8.3-xdebug \
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

RUN npm install -g pnpm

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
ADD default.php.ini /etc/php/8.3/mods-available/2024-default.ini
RUN ln -s /etc/php/8.3/mods-available/2024-default.ini /etc/php/8.3/apache2/conf.d/
RUN ln -s /etc/php/8.3/mods-available/2024-default.ini /etc/php/8.3/cli/conf.d/

# Configure vhost
ADD default.vhost.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
