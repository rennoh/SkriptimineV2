≈≈ç≈≈#!/bin/bash
# Küpsisetordi kalkulaator

read -p "Sisesta kandiku pikkus(cm): " kandik_pikkus
read -p "Sisesta kandiku laius(cm): " kandiku_laius
read -p "Sisesta küpsise pikkus(cm): " kypsise_pikkus
read -p "Sisesta küpsise laius(cm): " kypsis_laius
read -p "Siesta kihtide arv: " kihid
read -p "Sisesta küsiste arv ühes pakis: " pakki_maht

kypsiseid_pikkuses=$(expr $kandik_pikkus / $kypsise_pikkus)
kypsiseid_laiuses=$(expr $kandik_laius / $kypsis_laius)
kypsiseid_kihis=$(expr $kypsiseid_pikkuses \* $kypsiseid_laiuses)

kypsiseid_kokku=$(expr $küpsiseid_kihis \* $kihid)

pakkide_arv=$(expr \( $kypsiseid_kokku + $pakki_maht - 1 \) / $pakki_maht)

echo "--- ARVUTUSE TULEMUS ---"
echo "Ühes kihis on: $kypsiseid_kihis küpsist"
echo "Kogu tordi jaoks läheb vaja: $kypsiseid_kokku küpsist"
echo "Poest tuleb osta: $pakkide_arv pakki küpsiseid"
