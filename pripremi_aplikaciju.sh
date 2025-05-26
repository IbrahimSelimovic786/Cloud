#!/bin/bash

echo "Provjera potrebnih datoteka za aplikaciju..."

# Provjera da li su Docker i Docker Compose instalirani
if ! [ -x "$(command -v docker)" ]; then
  echo 'Greška: Docker nije instaliran.' >&2
  exit 1
fi

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Greška: Docker Compose nije instaliran.' >&2
  exit 1
fi

# Provjera postojanja direktorija
if [ ! -d "./frontend" ]; then
  echo "Greška: Direktorij 'frontend' ne postoji."
  exit 1
fi

if [ ! -d "./backend" ]; then
  echo "Greška: Direktorij 'backend' ne postoji."
  exit 1
fi

# Provjera potrebnih datoteka
if [ ! -f ".env" ]; then
  echo "Greška: Datoteka '.env' ne postoji."
  exit 1
fi

if [ ! -f "./frontend/nginx.conf" ]; then
  echo "Greška: Datoteka 'frontend/nginx.conf' ne postoji."
  exit 1
fi

if [ ! -f "./backend/Dockerfile" ]; then
  echo "Greška: Datoteka 'backend/Dockerfile' ne postoji."
  exit 1
fi

if [ ! -f "./frontend/Dockerfile" ]; then
  echo "Greška: Datoteka 'frontend/Dockerfile' ne postoji."
  exit 1
fi

if [ ! -f "docker-compose.yml" ]; then
  echo "Greška: Datoteka 'docker-compose.yml' ne postoji."
  exit 1
fi

echo "Sve potrebne datoteke postoje."
echo "Aplikacija je spremna. Možete je pokrenuti s ./pokreni_aplikaciju.sh"
chmod +x *.sh

exit 0