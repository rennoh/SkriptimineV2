#!/bin/bash
# Skript arvutab täidetud busside arvu ja maha jäänud inimeste arvu

read -p "Sisesta reisijate arv: " reisijad
read -p "Sisesta kohtade arv bussis: " kohad
# read -p, read prompt, ei ole vaja eraldi echot ja teadi
bussid=$(expr $reisijad / $kohad)
ulejaak=$(expr $reisijad % $kohad)

if [ $ulejaak -gt 0 ]; then # gt - greater than, siin (suurem kui) 0
    bussid=$(expr $bussid + 1)
fi #Lõppetab if tingimuse ploki

echo "Kokku on vaja $bussid bussi"
