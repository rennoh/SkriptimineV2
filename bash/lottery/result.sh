#!/bin/bash

show_header() {
    echo "=== Loto mäng ==="
}

check_matches() {
    local player_file="$1"
    local lottery_file="$2"
    local number

    tabamused=0

    while read -r number; do
        echo "Kontrollin numbrit $number..."

        if number_exists "$number" "$lottery_file"; then
            echo "TABAMUS!"
            tabamused=$((tabamused + 1))
        else
            echo "Ei tabanud."
        fi
    done < "$player_file"
}

get_result() {
    local matches="$1"

    if [[ $matches -eq 5 ]]; then
        tulemus="JACKPOT!"
    elif [[ $matches -eq 4 ]]; then
        tulemus="Väga hea tulemus!"
    elif [[ $matches -eq 3 ]]; then
        tulemus="Hea tulemus."
    elif [[ $matches -eq 2 ]]; then
        tulemus="Kaks tabamust."
    elif [[ $matches -eq 1 ]]; then
        tulemus="Üks tabamus."
    else
        tulemus="Seekord tabamusi ei olnud."
    fi
}

show_result() {
    local name="$1"
    local matches="$2"
    local result="$3"

    echo "Mängija: $name"
    echo "Tabamusi: $matches / 5"
    echo "$result"
}
