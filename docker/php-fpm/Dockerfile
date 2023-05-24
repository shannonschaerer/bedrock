FROM phpdockerio/php:8.2-fpm
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive
# set default USER_ID
ARG USER_ID=1000

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.2-mysql php8.2-sqlite php8.2-redis php8.2-intl php8.2-bcmath php8.2-imagick php8.2-gd php8.2-xdebug \
    sqlite3 libsqlite3-dev mysql-client \
    git cron \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

#Change userid to linux users userid
RUN usermod -u ${USER_ID} www-data

COPY crontab /etc/cron.d/crontab-task
RUN chmod 0644 /etc/cron.d/crontab-task
RUN crontab /etc/cron.d/crontab-task
RUN touch /var/log/cron.log

# Copy the start script.
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 0777 /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint.
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm8.2"]
