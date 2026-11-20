#!/bin/bash


# paigaldus ei küsi midagi 
export DEBIAN_FRONTEND=noninteractive

# kontrollime kas mysql server on juba olemas
# 'which mysqld' otsib serveri käsku
MYSQL=$(which mysqld 2>/dev/null)

if [ -z "$MYSQL" ]; then
    # mysql puudub paigaldame
    echo "Paigaldame mysql 9.7"

    # vajalikud abi paketid
    apt update
    apt install -y wget gnupg ca-certificates debconf-utils

    # anname ette vastused küsimustele (debconf-set-selections)
    # 1) valime versiooni 9.7 LTS
    echo "mysql-apt-config mysql-apt-config/select-server select mysql-9.7-lts" | debconf-set-selections
    # 2) ei paigalda lisatööriistu
    echo "mysql-apt-config mysql-apt-config/select-tools select Disabled" | debconf-set-selections
    # 3) kinnitame valiku
    echo "mysql-apt-config mysql-apt-config/select-product select Ok" | debconf-set-selections
    # 4) root parool
    echo "mysql-community-server mysql-community-server/root-pass password qwerty" | debconf-set-selections
    echo "mysql-community-server mysql-community-server/re-root-pass password qwerty" | debconf-set-selections

    # laeme alla MySQL repositooriumi pakett ja paigaldame selle
    wget -O /tmp/mysql-apt-config.deb https://dev.mysql.com/get/mysql-apt-config_0.8.40-1_all.deb
    dpkg -i /tmp/mysql-apt-config.deb

    # uuendame paketiinfo ja paigaldame mysql serveri
    apt update
    apt install -y mysql-server

    # käivitame teenuse ja lubame selle automaatse käivituse
    systemctl enable --now mysql
else
    # mysql on juba olemas
    echo "mysql on juba paigaldatud"
    echo "$MYSQL"
fi

# loome .my.cnf et mysql ei kysiks parooli
cat > "$HOME/.my.cnf" <<EOF
[client]
host=localhost
user=root
password=qwerty
EOF
# ainult omanik tohib faili lugeda
chmod 600 "$HOME/.my.cnf"

# kontrollime versiooni
mysql --version

# kontrollime kas teenus töötab
systemctl status mysql --no-pager

# kontrollime, kas server vastab päringule
mysql -e "SELECT VERSION();"
