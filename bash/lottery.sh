#!/bin/bash

# Tühjendame kahe faili sisu.
> player_numbers.txt
> lottery_numbers.txt

read -r -p "Sisesta oma nimi: " nimi

if [[ -z "$nimi" ]]; then
    nimi="Unknown"
fi

# Mängija numbrite sisestamine.
arv=0

while [[ $arv -lt 5 ]]; do
    read -r -p "Sisesta number (1–50): " number

    if [[ -z "$number" ]]; then
        echo "Sa ei sisestanud midagi."
        continue
    fi

    if [[ ! "$number" =~ ^[0-9]+$ ]]; then
        echo "Sisesta täisarv."
        continue
    fi

    if [[ ! "$number" =~ ^([1-9]|[1-4][0-9]|50)$ ]]; then
        echo "Sisesta number 1–50 ilma algusnullideta."
        continue
    fi

    olemas=0

    while read -r vana; do
        if [[ "$number" == "$vana" ]]; then
            olemas=1
        fi
    done < player_numbers.txt

    if [[ $olemas -eq 1 ]]; then
        echo "See number on juba valitud."
    else
        echo "$number" >> player_numbers.txt
        arv=$((arv + 1))
    fi
done

echo "Sinu numbrid:"
cat player_numbers.txt

# Võidunumbrite loosimine.
arv=0

while [[ $arv -lt 5 ]]; do
    number=$((RANDOM % 50 + 1))
    olemas=0

    while read -r vana; do
        if [[ "$number" == "$vana" ]]; then
            olemas=1
        fi
    done < lottery_numbers.txt

    if [[ $olemas -eq 0 ]]; then
        echo "$number" >> lottery_numbers.txt
        arv=$((arv + 1))
    fi
done

echo "Võidunumbrid:"
cat lottery_numbers.txt

# Tabamuste kontrollimine.
tabamused=0

while read -r number; do
    echo "Kontrollin numbrit $number..."
    tabamus=0

    while read -r voit; do
        if [[ "$number" == "$voit" ]]; then
            tabamus=1
        fi
    done < lottery_numbers.txt

    if [[ $tabamus -eq 1 ]]; then
        echo "TABAMUS!"
        tabamused=$((tabamused + 1))
    else
        echo "Ei tabanud."
    fi
done < player_numbers.txt

# Tulemuse hinnang.
if [[ $tabamused -eq 5 ]]; then
    tulemus="JACKPOT!"
elif [[ $tabamused -eq 4 ]]; then
    tulemus="Väga hea tulemus!"
elif [[ $tabamused -eq 3 ]]; then
    tulemus="Hea tulemus."
elif [[ $tabamused -eq 2 ]]; then
    tulemus="Kaks tabamust."
elif [[ $tabamused -eq 1 ]]; then
    tulemus="Üks tabamus."
else
    tulemus="Seekord tabamusi ei olnud."
fi

echo "Mängija: $nimi"
echo "Tabamusi: $tabamused / 5"
echo "$tulemus"

# Salvestame mängu tulemuse faili lõppu.
echo "========================================" >> results.txt
date >> results.txt
echo "Player: $nimi" >> results.txt
echo "Player numbers:" >> results.txt
cat player_numbers.txt >> results.txt
echo "Lottery numbers:" >> results.txt
cat lottery_numbers.txt >> results.txt
echo "Matches: $tabamused" >> results.txt
echo "Result: $tulemus" >> results.txt
