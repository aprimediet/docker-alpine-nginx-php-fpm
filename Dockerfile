FROM aprimediet/alpine-nginx:latest
LABEL maintainer="<Muhamad Aditya Prima> aprimediet@gmail.com"

# INSTALL PHP7
RUN apk update && apk upgrade && \
    apk add --update --no-cache \
    git php7 php7-gd php7-xsl php7-zip \
    php7-curl php7-zlib php7-json php7-pgsql \
    php7-mcrypt php7-tidy php7-dom php7-redis \
    php7-openssl php7-fpm php7-fileinfo php7-tokenizer \
    php7-xmlwriter php7-xml php7-pdo php7-pdo_pgsql \
    composer

# COPY Configuration File
RUN mkdir -p /var/run/php
ADD etc /etc
ADD usr /usr

EXPOSE 80