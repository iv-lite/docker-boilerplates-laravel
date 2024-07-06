#!/usr/bin/env sh

if [ -z $APP_NAME ] || [ $APP_NAME = "boilerplate" ]; then
    echo "Please provide a name different than boilerplate."
    exit 1
fi

if [ -f composer.json ]; then
    echo "Project already initialized"
    exit 1
fi

cd /app

if ! [ -f /app/composer.json ]; then
    laravel new $APP_NAME
    cp -a /app/$APP_NAME/. .
    rm -rf $APP_NAME

    php artisan migrate:reset
fi

if [ $DB_CONNECTION = "sqlite" ]; then
    rm /app/${DB_DATABASE}
fi

if [ $DEBUG_INIT = true ]; then
    cp /app/.env.app /app/.env
else
    mv /app/.env.app /app/.env
    rm -rf .git
    git init
fi

php artisan key:generate
php artisan make:session-table
php artisan migrate --seed
