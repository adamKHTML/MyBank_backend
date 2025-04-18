FROM jenkins/inbound-agent

USER root

# Mettre à jour les paquets
RUN apt update && apt install -y \
    php-common \
    php-cli \
    libapache2-mod-php \
    unzip \
    git-ftp \
    curl \
    git \
    && apt clean

# Installer Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php \
 && mv composer.phar /usr/local/bin/composer \
 && php -r "unlink('composer-setup.php');"

# Installer Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh \
 && sh get-docker.sh \
 && rm get-docker.sh
