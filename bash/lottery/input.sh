#!/bin/bash

read_player() {
    read -r -p "Sisesta oma nimi: " nimi || return 1

    if [[ -z "$nimi" ]]; then
        nimi="Unknown"
    fi

    return 0
}

valid_number() {
    local number="$1"

    if [[ -z "$number" ]]; then
        echo "Sa ei sisestanud midagi."
        return 1
    fi

    if [[ ! "$number" =~ ^[0-9]+$ ]]; then
        echo "Sisesta täisarv."
        return 1
    fi

    if [[ ! "$number" =~ ^([1-9]|[1-4][0-9]|50)$ ]]; then
        echo "Sisesta number 1–50 ilma algusnullideta."
        return 1
    fi

    return 0
}

read_player_numbers() {
    local file="$1"
    local count=0
    local number

    while [[ $count -lt 5 ]]; do
        read -r -p "Sisesta number (1–50): " number || return 1

        if ! valid_number "$number"; then
            continue
        fi

        if number_exists "$number" "$file"; then
            echo "See number on juba valitud."
        else
            echo "$number" >> "$file" || return 1
            count=$((count + 1))
        fi
    done

    return 0
}
