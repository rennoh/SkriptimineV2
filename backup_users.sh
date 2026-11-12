#!/bin/bash

lahtekaust="/home"
sihtkaust="/home_bcp"

kuupaev=$(date +%d.%m.%Y)

echo "=== KASUTAJATE VARUNDAMINE ==="
echo "Kuupäev: $kuupaev"
echo "Lähtekaust: $lahtekaust"
echo "Sihtkaust:  $sihtkaust"
echo "----------------------------------------"

if [ ! -d "$sihtkaust" ]; then
    echo "Loon sihtkataloogi: $sihtkaust"
    mkdir -p "$sihtkaust"
fi

for kasutajakaust in "$lahtekaust"/*; do
    if [ -d "$kasutajakaust" ]; then
        kasutaja=$(basename "$kasutajakaust")
        arhiiv="${kasutaja}.${kuupaev}.tar.gz"

        echo "[+] Varundan kasutajat: $kasutaja"
        
        tar --warning=no-file-ignored \
            --exclude="$kasutaja/.warp" \
            --exclude="$kasutaja/.cache" \
            -czf "$sihtkaust/$arhiiv" \
            -C "$lahtekaust" "$kasutaja"
            
        echo "    Valmis: $sihtkaust/$arhiiv ($(du -h "$sihtkaust/$arhiiv" | awk '{print $1}'))"
    fi
done

echo "----------------------------------------"
echo "Kõik kasutajate kodukataloogid on edukalt varundatud!"
