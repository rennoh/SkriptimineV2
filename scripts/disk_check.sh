#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$BASE_DIR/config/settings.conf"

usage=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

if [ -z "$usage" ]; then
    echo "Viga: kettakasutust ei õnnestunud lugeda."
    exit 1
fi

echo "Kettakasutus: ${usage}%"

if [ "$usage" -lt "$DISK_LIMIT" ]; then
    echo "OK: kettaruumi kasutus on normis."
    exit 0
else
    echo "HOIATUS: kettaruumi kasutus on liiga suur."
    exit 1
fi
