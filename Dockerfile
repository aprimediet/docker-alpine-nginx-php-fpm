ARG ALPINE_VERSION=3.16

FROM aprimediet/nginx:alpine-${ALPINE_VERSION}
LABEL maintainer="<Muhamad Aditya Prima> aprimediet@gmail.com"

# INSTALL php5
# RUN apk update && apk upgrade && \
RUN apk add --update --no-cache \
    git php8 php8-bz2 php8-bcmath php8-common \
    php8-ctype php8-curl php8-dev \
    php8-dom php8-embed php8-exif php8-fileinfo \
    php8-fpm php8-ftp php8-gd php8-gettext php8-gmp \
    php8-iconv php8-intl php8-ldap php8-openssl php8-pear \
    php8-pspell php8-session php8-simplexml php8-snmp php8-soap \
    php8-sockets php8-tidy php8-tokenizer php8-xml php8-xmlreader \
    php8-xmlwriter php8-xsl php8-zip php8-dbg

# COPY Configuration File
RUN mkdir -p /var/run/php
RUN mkdir -p /var/log/php8
RUN touch /var/log/php8/error.log
ADD ./etc/nginx /etc/nginx
ADD ./etc/services.d/php-fpm8 /etc/services.d/php-fpm8
ADD usr /usr

EXPOSE 80