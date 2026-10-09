#!/bin/bash

generate_lottery_numbers() {
    local file="$1"
    local count=0
    local number

    while [[ $count -lt 5 ]]; do
        number=$((RANDOM % 50 + 1))

        if ! number_exists "$number" "$file"; then
            echo "$number" >> "$file" || return 1
            count=$((count + 1))
        fi
    done

    return 0
}
