#!/bin/bash

if ! command -v systemctl >/dev/null 2>&1; then
    echo "Viga: systemctl puudub."
    exit 1
fi

echo "Teenused ja nende olekud:"
echo

systemctl list-units --type=service --all --no-pager
