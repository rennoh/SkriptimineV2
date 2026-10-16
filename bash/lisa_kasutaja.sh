#!/bin/bash

# Skript vajab täpselt ühte parameetrit.
if [ "$#" -ne 1 ]; then
    echo "Kasutamine: $0 kasutajanimi" >&2
    exit 1
fi

# Kasutaja loomiseks on vaja root-õigusi.
if [ "$EUID" -ne 0 ]; then
    echo "Käivita skript sudo abil või root-kasutajana." >&2
    exit 1
fi

kasutajanimi="$1"

if id "$kasutajanimi" &>/dev/null; then
    echo "Kasutaja '$kasutajanimi' on juba olemas." >&2
    exit 1
fi

# -m loob kodukataloogi ja kopeerib sinna /etc/skel sisu.
# -U loob kasutajale samanimelise grupi.
if useradd -m -U -d "/home/$kasutajanimi" -s /bin/bash "$kasutajanimi"; then
    echo "Kasutaja '$kasutajanimi' on loodud."
    id "$kasutajanimi"
    ls -la "/home/$kasutajanimi"
else
    echo "Kasutaja loomine ebaõnnestus." >&2
    exit 1
fi
