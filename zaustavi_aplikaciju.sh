#!/bin/bash

echo "Zaustavljanje aplikacije..."

docker-compose stop

echo "Aplikacija je zaustavljena. Podaci su sačuvani i možete ponovo pokrenuti aplikaciju s ./pokreni_aplikaciju.sh"

exit 0