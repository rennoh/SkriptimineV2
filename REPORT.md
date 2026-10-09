# Arvestustöö raport

Nimi: Renno Henno
Variant: A
Kuupäev: 09.10.2026

## Probleem 1
- Skript: system_info.sh
- Mida skript näiliselt tegi: naitas arvuti nime ja kasutajat.
- Mis oli tegelikult vale: need olid vahetuses.
- Kuidas vea avastasin: võrdlesin tulemusi.
- Millise käsuga kontrollisin: hostname ja whoami.
- Parandus: kasutasin hostname j whoami.
- Kuidas kontrollisin pärast parandust: kaivitasin skripti ja samad käsud.

## Probleem 2
- Skript: system_info.sh
- Mida skript näiliselt tegi: näitas kernelit, tooaega ja mälu.
- Mis oli tegelikult vale: näitas arhitektuuri, kellaaega ja Swap mälu.
- Kuidas vea avastasin: vaatasin skripti käske.
- Millise käsuga kontrollisin: uname -r, uptime -p ja free -m
- Parandus: kasutasin uname -r, uptime -p ja lugesin Mem rea teise välja.
- Kuidas kontrollisin pärast parandust: võrdlesin samade kaskudega

## Probleem 3
- Skript: disk_check.sh
- Mida skript näiliselt tegi: näitas kettakasutust.
- Mis oli tegelikult vale: luges vaba ruumi veergu ja näitas 26%, päris kasutus oli 9%.
- Kuidas vea avastasin: vaatasin valjunditt
- Millise käsuga kontrollisin: bash -x scripts/disk_check.sh ja df -P /.
- Parandus: lugesin viienda veeru ja eemaldasin protsendimargi
- Kuidas kontrollisin pärast parandust: näitas 9 protsendi. Piiriga 80 tuli kood 0, piiriga 0 tuli kood 1.

## Probleem 4
- Skript: user_check.sh
- Mida skript näiliselt tegi: kontrollis kasutajat
- Mis oli tegelikult vale: otsis /etc/group failist ja tingimus matches >= 0 oli alati tõene.
- Kuidas vea avastasin: proovisin olematut kasutajat ja tühja sisendit.
- Millise käsuga kontrollisin: getent passwd ja bash scripts/user_check.sh.
- Parandus: kontrollisin tühja sisendit ja kasutasin getent passwd.
- Kuidas kontrollisin pärast parandust: root kood 0, olematu kasutaja kood 1, tühi sisend kood 2

## Probleem 5
- Skript: service_check.sh
- Mida skript näiliselt tegi: kontrollis teenuse tootamist.
- Mis oli tegelikult vale: kontrollis teenusefaili olemasolu. apt-daily polnud tööl.
- Kuidas vea avastasin: kontrollisin ise teenuse olekut.
- Millise käsuga kontrollisin: systemctl is-active apt-daily.
- Parandus: kasutasin systemctl is-active --quiet
- Kuidas kontrollisin pärast parandust: proovisin aktiivset mitteaktiivset ja olematut teenust ning tühja sisendit.

## Probleem 6
- Skript: backup.sh
- Mida skript näiliselt tegi: tegi varukoopia.
- Mis oli tegelikult vale: kirjutas ainult failinimed fail oli ASCII text.
- Kuidas vea avastasin: proovisin arhiivi luged
- Millise käsuga kontrollisin: file ja tar -tzf.
- Parandus: kasutasin tar -czf päris arhiivi loomisek.
- Kuidas kontrollisin pärast parandust: tastasin ajutisse kausta ja võrdlesin diff -r abil erinevusi polnu kood oli 0.

## Uus funktsionaalsus
- Mida lisasin: memory_info.sh ja menüü valiku 6: Mälu info.
- Kuidas käivitada: bash main.sh ja valik 6
- Kuidas kontrollisin, et tulemus on õige: kaivitasin menuust ja võrdlesin käsuga free -m.
