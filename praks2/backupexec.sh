#!/bin/bash

# teen ajutise kausta ja panen trapi, et see pärast ära kustutataks
ajutine=$(mktemp -d)
trap 'rm -rf "$ajutine"' EXIT

# panen logifaili algusaja kirja
echo "[ $(date '+%F %T') ] BACKUP START" >> ~/praks2/logs/backup.log
echo "Alustan varundamist"

# kontrollin kas kettal on üldse piisavalt ruumi
vaja=$(du -sb ~/praks2/src | awk '{print $1}')
vaba=$(df -B1 ~/praks2/backup | awk 'NR==2{print $4}')

if [ "$vaba" -le "$vaja" ]; then
    echo "Viga: kettal pole ruumi"
    exit 1
fi

# teen failinime kuupäeva ja kellaajaga
kuupaev=$(date +%Y%m%d_%H%M%S)
failinimi="src_${kuupaev}.tar.zst"

# pakin zstd-ga kokku ja jätan välja need asjad, mis on .backupignore failis
tar -I 'zstd -19 -T0' --exclude-from="$HOME/praks2/src/.backupignore" -cf "$ajutine/$failinimi" -C ~/praks2 src
echo "Arhiiv valmis tehtud"

# kontrollin kas arhiiv avaneb ilusti
tar -tf "$ajutine/$failinimi" > /dev/null
echo "Arhiiv on terve"

# arvutan sha256 kontrollsumma ja kontrollin üle
cd "$ajutine"
sha256sum "$failinimi" > "${failinimi}.sha256"
sha256sum -c "${failinimi}.sha256"

# liigutan valmis failid backup kausta
mv "$ajutine/$failinimi" ~/praks2/backup/
mv "$ajutine/${failinimi}.sha256" ~/praks2/backup/

# kustutan vanad arhiivid ära, jätan alles 3 kõige uuemat
cd ~/praks2/backup
ls -1t src_*.tar.zst | tail -n +4 | xargs -r rm -f

# panen logisse kirja et sai valmis
echo "[ $(date '+%F %T') ] BACKUP FINISHED" >> ~/praks2/logs/backup.log
echo "Varundamine edukalt lõpetatud"
