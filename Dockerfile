ARG ALPINE_VERSION=3.18
ARG PHP_VERSION=82

FROM aprimediet/nginx:${ALPINE_VERSION} AS nginx_base

FROM aprimediet/php:fpm-${PHP_VERSION}-alpine AS php_base
LABEL maintainer="<Muhamad Aditya Prima> aprimediet@gmail.com"

# INSTALL nginx
RUN apk add --update --no-cache \
    nginx

# COPY Configuration file from nginx
#COPY --from=nginx_base /etc/nginx /etc/nginx
# WORKAROUND FOR ALPINE 3.13+
COPY --from=nginx_base /etc/nginx/* /etc/nginx/
COPY --from=nginx_base /etc/services.d/nginx /etc/services.d/nginx

ADD ./etc/nginx/* /etc/nginx/
ADD usr /usr

EXPOSE 80