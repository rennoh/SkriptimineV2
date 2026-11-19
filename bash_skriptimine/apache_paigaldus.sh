#!/bin/bash
# apache paigaldusskript
# Kontrollib, kas apache2 on paigaldatud. Kui pole, paigaldab; muidu annab teada ja näitab staatust.

# Kontrollime, kas skripti käivitab root (root'i UID on 0)
if [ "$EUID" -ne 0 ]; then
    echo "Käivita skript root-õigustega (sudo)"
    exit 1
fi

# Mitu rida "ok installed" leiti (0 = pole paigaldatud, 1 = on)
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')

if [ $APACHE2 -eq 0 ]; then
    echo "Paigaldame apache2"
    apt update                      # värskendame paketiloendi (väldib 404 vigu)
    # $? on eelmise käsu väljumiskood: 0 = õnnestus, muu = viga
    if apt install -y apache2; then
        echo "Apache on paigaldatud"
    else
        echo "Apache paigaldamine ebaõnnestus"
        exit 1
    fi
elif [ $APACHE2 -eq 1 ]; then
    echo "apache2 on juba paigaldatud"
    service apache2 start
    service apache2 status
fi

