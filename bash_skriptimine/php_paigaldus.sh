#!/bin/bash
# php paigaldusskript

# kontrollime kas php kask on olemas
# 'which php' otsib käsku; kui ei leia, on väljund tühi
# /dev/null tähendab et valjundit ei naiata ekraanil
PHP=$(which php 2>/dev/null)

# kui muutuja PHP on tühi siis php ei ole paigaldatud
if [ -z "$PHP" ]; then
    echo "Paigaldame php ja vajalikud lisad"
    apt update
    apt install -y php libapache2-mod-php php-mysql
    echo "php on paigaldatud"
else
    # muidu on php juba olemas
    echo "php on juba paigaldatud"
    # näitame kus php asub
    echo "$PHP"
fi

# näitame php versiooni
php -v

# kui apache on olemas taaskäivitame sell et php moodul hakkaks tööle
systemctl restart apache2 2>/dev/null
