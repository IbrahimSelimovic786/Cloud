#!/bin/bash

echo "Pokretanje aplikacije..."

# Pokretanje Docker Compose
docker-compose up -d

# Provjera da li su kontejneri pokrenuti
echo "Provjera statusa kontejnera..."
sleep 5

if [ "$(docker ps -q -f name=mysql-db)" ] && [ "$(docker ps -q -f name=spring-backend)" ] && [ "$(docker ps -q -f name=vue-frontend)" ]; then
  echo "Aplikacija je uspješno pokrenuta!"
  echo "Pristupite aplikaciji na: http://localhost:8080"
  echo "Backend API je dostupan na: http://localhost:8085"
else
  echo "Greška: Neki kontejneri nisu pokrenuti. Provjerite docker-compose logs za više informacija."
  exit 1
fi

exit 0