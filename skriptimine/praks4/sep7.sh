#!/bin/bash
# Skript kontrollib, kas kahe sõna viimased tähed on samad

read -p "Sisesta esimene sõna: " sona1
read -p "Sisesta teine sõna: " sona2

# Võtab sõna lõpust viimase tähe
taht1=$(echo -n $sona1 | tail -c 1)
taht2=$(echo -n $sona2 | tail -c 1)

if [ $taht1 = $taht2 ]; then
    echo "Viimased tähed on samad!"
else
    echo "Viimased tähed ei ole samad!"
fi
