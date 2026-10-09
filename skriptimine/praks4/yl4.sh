#!/bin/bash
# Skript kontrollib käsurea parameetrina antud täisarvu paarsust

if [ $# -ne 1 ]; then  # -ne: not equal siin vaatab kas parameetreid on 1 mitte 0 või 2+, $# - hoiab parameetrite koguarrvu
    echo "Kaivita see skript koos arvuga mille paarsus soovid kontrollida. Näiteks:  ./yl4 3"
else
    
    arv=$1

    if (( arv % 2 == 0 )); then
        echo "Antud arv on paaris"
    else
        echo "Antud arv on paaritu"
    fi
fi

