ARG ALPINE_VERSION=3.18
ARG PHP_VERSION=8.2

FROM aprimediet/nginx:${ALPINE_VERSION} AS nginx_base
RUN echo "ONLY FOR COPYING NGINX FILE"

FROM aprimediet/php:${PHP_VERSION} AS php_base
LABEL maintainer="<Muhamad Aditya Prima> aprimediet@gmail.com"

# INSTALL nginx
RUN --mount=type=cache,target=/var/cache/apk \
    apk add --update nginx

# COPY Configuration file from nginx
COPY --from=nginx_base /etc/nginx/* /etc/nginx/
COPY --from=nginx_base /etc/services.d/nginx /etc/services.d/nginx

ADD ./etc/nginx/conf.d /etc/nginx/conf.d
ADD usr /usr

RUN mkdir -p /run/nginx

# Clean APK Cache
RUN rm -rf /var/cache/apk/*

EXPOSE 80