#!/bin/bash

# Kasutajate lisamise skript
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
    failinimi=$1

    if [ -f "$failinimi" -a -r "$failinimi" ]; then
        echo "Fail on korras"

        for nimi in $(cat "$failinimi")
        do
            bash ./lisa_kasutaja.sh "$nimi"
        done
    else
        echo "Probleem failiga $failinimi"
    fi
fi
