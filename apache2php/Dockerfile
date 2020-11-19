FROM php:7.1.33-apache-stretch

# tag: wangsying/php:7.1.33-apache

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

COPY ./sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get install -y \
      libicu-dev \
      libpq-dev \
      libmcrypt-dev \
      libzip-dev \
      zlib1g-dev \
      libmemcached-dev \
      libapache2-mod-rpaf \
    && rm -r /var/lib/apt/lists/* 

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd 
RUN docker-php-ext-install \
      zip \
      intl \
      mbstring \
      mcrypt \
      pcntl \
      mysqli \
      pdo \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      zip \
      opcache

RUN pecl install xdebug && pecl install memcached && pecl install redis \
    && docker-php-ext-enable xdebug memcached redis

RUN a2enmod rewrite ssl proxy proxy_http proxy_balancer lbmethod_byrequests

RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list

RUN rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*