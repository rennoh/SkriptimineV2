#!/bin/bash

service="$1"

if [ -z "$service" ]; then
    echo "Sisesta teenuse nimi."
    exit 2
fi

if systemctl is-active --quiet "$service"; then
    echo "Teenus $service töötab."
    exit 0
else
    echo "Teenus $service ei tööta või puudub."
    exit 1
fi
