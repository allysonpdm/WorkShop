FROM gitpod/workspace-mysql

USER gitpod

RUN sudo touch /var/log/workspace-image.log \
    && sudo chmod 666 /var/log/workspace-image.log \
    && sudo touch /var/log/workspace-init.log \
    && sudo chmod 666 /var/log/workspace-init.log \
    && sudo touch /var/log/xdebug.log \
    && sudo chmod 666 /var/log/xdebug.log

RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
    && sudo apt-get update -q \
    && sudo apt-get -y install php7.4-fpm rsync grc shellcheck php-apcu php-imagick \
    && sudo apt-get remove composer -y \
    && sudo apt-get clean    

RUN sudo curl -o /usr/bin/composer https://getcomposer.org/composer.phar && \
    sudo chmod +x /usr/bin/composer && \
    sudo composer selfupdate && \
    sudo rm -rf /root/.composer && \
    composer global require drush/drush-launcher && \
    echo 'export PATH="$PATH:~/.config/composer/vendor/bin"' >> ~/.bashrc
