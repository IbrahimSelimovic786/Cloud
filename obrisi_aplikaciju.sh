#!/bin/bash

echo "Brisanje aplikacije..."

docker-compose down --rmi all -v

echo "Aplikacija je obrisana. Svi kontejneri, slike, mreže i volumeni su uklonjeni."

exit 0