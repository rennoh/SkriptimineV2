#!/bin/bash
#Paarisuse kontroll
read -p "Sisesta suvaline täisarv: " arv

if (( arv % 2 == 0 )); then #  see arvutab kas see arv jagada kagega on 0 voi mitte
    echo "Antud arv on paaris"
else
    echo "Antud arv on paaritu"
fi 
