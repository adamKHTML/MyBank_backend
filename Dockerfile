FROM php:8.2-apache

# Définir le dossier de travail
WORKDIR /var/www/

# Créer un dossier project
RUN mkdir project

# Copier tous les fichiers dans le dossier project
COPY . project

# Activer mod_rewrite (utile pour Symfony)
RUN a2enmod rewrite

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    wget \
    zip \
    libonig-dev \
    libicu-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql zip intl opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer Composer
RUN wget https://getcomposer.org/download/2.0.9/composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Copier ta configuration Apache perso
COPY vhosts.conf /etc/apache2/sites-enabled/000-default.conf

# Donner les bons droits d’écriture à Symfony
RUN mkdir -p /var/www/project/var/cache /var/www/project/var/log \
    && chown -R www-data:www-data /var/www/project/var \
    && chmod -R 777 /var/www/project/var/cache /var/www/project/var/log

# Redémarrer Apache (ou laisser Docker gérer avec CMD)
RUN /etc/init.d/apache2 restart

# Lancer Apache en mode foreground (Docker CMD)
CMD ["apache2-foreground"]
