FROM serversideup/php:8.3-fpm-nginx

USER root

# Install New Extensions
RUN install-php-extensions gd

ARG USER_ID
ARG GROUP_ID

USER root
RUN docker-php-serversideup-set-id www-data $USER_ID:$GROUP_ID  && \
    docker-php-serversideup-set-file-permissions --owner $USER_ID:$GROUP_ID --service nginx

USER www-data

