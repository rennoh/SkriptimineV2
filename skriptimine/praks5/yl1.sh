#!/bin/bash
# Skript küsib kasutaja vanust ja väljastab vastava vanusegrupi või veateate

# Küsib kasutajalt vanuse väärtuse
read -p "Sisesta (oma) vanus: " vanus

# Kontrollib vanusevahemikke ja väljastab teate
if test $vanus -ge 0 -a $vanus -lt 11 # vaatab kas vanus on suurem kui 0 ja vaiksem kui 11
then 
        echo "Oled laps"
elif test $vanus -ge 11 -a $vanus -lt 18
then
        echo "Oled nooruk"
elif test $vanus -ge 18 -a $vanus -lt 63
then
        echo "Oled täiskasvanu"
elif test $vanus -ge 63
then
        echo "Oled senioor"
else
        echo "Vigane sisend"
fi

# ENDA ÕPPIMISEKS
# -ge: greater than, -a: and(JA), -lt: less than
