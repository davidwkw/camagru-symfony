#! /bin/sh

apt-get -y update && apt-get -y upgrade

if command -v node >/dev/null 2>&1; then
    echo "Node.js is installed."
    node -v
else
    echo "Installing node..."
    curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
    apt-get install -y nodejs
fi

if ! [ -f "/bin/bash" ]; then
	apt-get install -y bash
fi

if ! [ -d "/etc/php/8.2/fpm" ]; then
	apt-get install -y php8.2-fpm php8.2-pgsql php8.2-curl php8.2-xml php8.2-intl php8.2-mbstring
    cp /php-fpm_conf/php.ini /etc/php/8.2/fpm/php.ini
fi

if ! [ -f "/bin/symfony" ]; then
    curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
    apt install -y symfony-cli
fi

if ! [ -d "/var/www/html/camagru" ]; then
	mkdir -p /var/www/html/camagru
    chmod -R 777 /var/www/html/camagru
fi

sed -i 's/user\s*nginx;/user www-data;/g' /etc/nginx/nginx.conf

echo "Setting up fpm-cgi pool config..."
sed -i "s/^;\s*ping.path\s*=\s*\/ping/ping.path = \/ping/g" /etc/php/8.2/fpm/pool.d/www.conf
sed -i "s/^;\s*ping.response\s*=\s*pong/ping.response = pong/g" /etc/php/8.2/fpm/pool.d/www.conf
echo "Finished setting up fpm-cgi"

php-fpm8.2
