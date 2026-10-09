#!/usr/bin/env bash

username="$1"

if [ -z "$username" ]; then
    echo "Viga: sisesta kasutajanimi."
    exit 2
fi

if getent passwd "$username" > /dev/null; then
    echo "Kasutaja $username eksisteerib."
    exit 0
else
    echo "Kasutajat $username ei leitud."
    exit 1
fi
