# imagen de dockerhub que descargara
FROM php:8.2.4-fpm

RUN apt-get update && apt-get install -y apt-transport-https

# algunas configuraciones para que funcione el contenedor
RUN apt-get update && \
    apt-get install -y git unzip libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql

# instala composer en el contenedor
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# da permisos para editar los archivos en esta ruta del container
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www