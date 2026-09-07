#!/bin/bash
# Skript arvutab täidetud busside arvu ja maha jäänud inimeste arvu

read -p "Sisesta reisijate arv: " reisijad
read -p "Sisesta kohtade arv bussis: " kohad

bussid=$(expr $reisijad / $kohad)
ulejaak=$(expr $reisijad % $kohad)

echo "Täidetud bussid: $bussid"
echo "Maha jäänud inimesi: $ulejaak"

