#!/bin/bash

clear_files() {
    local player_file="$1"
    local lottery_file="$2"

    > "$player_file" || return 1
    > "$lottery_file" || return 1
    return 0
}

# 0 tähendab, et number leiti; 1 tähendab, et ei leitud.
number_exists() {
    local number="$1"
    local file="$2"
    local saved_number

    while read -r saved_number; do
        if [[ "$number" == "$saved_number" ]]; then
            return 0
        fi
    done < "$file"

    return 1
}

show_numbers() {
    local title="$1"
    local file="$2"

    echo "$title"
    cat "$file"
}

save_result() {
    local name="$1"
    local matches="$2"
    local result="$3"
    local player_file="$4"
    local lottery_file="$5"

    {
        echo "========================================"
        echo "Date: $(date)"
        echo "Player: $name"
        echo "Player numbers:"
        cat "$player_file"
        echo "Lottery numbers:"
        cat "$lottery_file"
        echo "Matches: $matches"
        echo "Result: $result"
        echo
    } >> results.txt
}
