#!/usr/bin/env sh

if [ -z $1 ] || [ $1 = "boilerplate" ]; then
    echo "Please provide a name different than boilerplate."
    exit 1
fi

laravel new $1
cp -a /app/$1/. .
rm -rf $1
php artisan migrate:reset

if [ $DEBUG_INIT = true ]; then
    cp /app/.env.app /app/.env
else
    mv /app/.env.app /app/.env
    rm -rf .git
    git init
fi

php artisan key:generate
php artisan migrate:refresh
php artisan migrate --seed
