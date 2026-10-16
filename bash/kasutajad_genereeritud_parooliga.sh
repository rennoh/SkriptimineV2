#!/bin/bash

# Kasutajate loomine ja paroolide genereerimine
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
    failinimi=$1

    if [ -f "$failinimi" -a -r "$failinimi" ]; then
        # Uued failid on loetavad ainult omanikule
        umask 077
        logifail=loodud_kasutajad_paroolidega
        touch "$logifail"
        chmod 600 "$logifail"

        for nimi in $(cat "$failinimi")
        do
            parool=$(pwgen -s 16 1)

            if useradd -m -U -s /bin/bash "$nimi"; then
                if echo "$nimi:$parool" | chpasswd; then
                    echo "$nimi:$parool" >> "$logifail"
                    echo "Kasutaja $nimi on loodud ja parool salvestatud"
                else
                    echo "Kasutaja $nimi parooli määramine ebaõnnestus"
                fi
            fi
        done
    else
        echo "Probleem failiga $failinimi"
    fi
fi
