#!/bin/bash

# Kasutajate ja paroolide lugemine kahest failist
if [ $# -ne 2 ]; then
    echo "Kasutusjuhend: $0 kasutajate_fail paroolide_fail"
else
    kasutajad=$1
    paroolid=$2

    if [ -f "$kasutajad" -a -r "$kasutajad" ] &&
       [ -f "$paroolid" -a -r "$paroolid" ]; then

        if [ "$(awk 'END {print NR}' "$kasutajad")" -ne "$(awk 'END {print NR}' "$paroolid")" ]; then
            echo "Failides peab olema sama palju ridu"
            exit 1
        fi

        rida=1

        for nimi in $(cat "$kasutajad")
        do
            parool=$(sed -n "${rida}p" "$paroolid")

            if useradd -m -U -s /bin/bash "$nimi"; then
                echo "$nimi:$parool" | chpasswd
                echo "Kasutaja $nimi on loodud"
            fi

            rida=$((rida + 1))
        done
    else
        echo "Probleem failidega"
    fi
fi
