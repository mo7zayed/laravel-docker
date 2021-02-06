if [ ! -d "src" ]; then
  mkdir src;
fi

# the '.' refers to the working dir of composer container
docker-compose run --rm composer create-project laravel/laravel .;

rm -rf src/.env;

docker-compose up -d server php mysql;

docker-compose run --rm composer require laravel/breeze --dev;
docker-compose run --rm artisan breeze:install;
docker-compose run --rm npm install;
docker-compose run --rm npm run dev;
docker-compose run --rm artisan migrate;