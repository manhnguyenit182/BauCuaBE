FROM php:8.4-cli

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends git unzip curl libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 8000

CMD ["php", "-v"]
