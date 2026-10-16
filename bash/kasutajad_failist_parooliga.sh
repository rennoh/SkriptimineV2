#!/bin/bash

# Kasutajate ja paroolide lisamine failist
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
    failinimi=$1

    if [ -f "$failinimi" -a -r "$failinimi" ]; then
        echo "Fail on korras"

        for rida in $(cat "$failinimi")
        do
            nimi=$(echo "$rida" | cut -d: -f1)
            parool=$(echo "$rida" | cut -d: -f2-)

            if bash ./lisa_kasutaja.sh "$nimi"; then
                echo "$nimi:$parool" | chpasswd
            fi
        done
    else
        echo "Probleem failiga $failinimi"
    fi
fi
