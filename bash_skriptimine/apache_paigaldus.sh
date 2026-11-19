#!/bin/bash
# Paigaldusskript: apache2 või ansible

# root'i kontroll (root'i EUID on 0)
if [ "$EUID" -ne 0 ]; then
    echo "Käivita skript root-õigustega (sudo)"
    exit 1
fi

# menüü: küsime kasutajalt valiku (read -p kuvab küsimuse)
echo "Vali, mida paigaldada:"
echo "1) apache2"
echo "2) ansible"
read -p "Sisesta valik (1 või 2): " VALIK

# case seab valiku järgi paketi nime
case $VALIK in
    1) PAKETT="apache2" ;;
    2) PAKETT="ansible" ;;
    *) echo "Vigane valik"; exit 1 ;;
esac

# mitu rida 'ok installed' leiti (0 = pole, 1 = on)
PAIGALDATUD=$(dpkg-query -W -f='${Status}' $PAKETT 2>/dev/null | grep -c 'ok installed')

if [ $PAIGALDATUD -eq 0 ]; then
    echo "Paigaldame $PAKETT"
    apt update                  # värske paketiloend (väldib 404 viga)
    if apt install -y $PAKETT; then
        echo "$PAKETT on paigaldatud"
    else
        echo "$PAKETT paigaldamine ebaõnnestus"
        exit 1
    fi
else
    echo "$PAKETT on juba paigaldatud"
    if [ "$PAKETT" = "apache2" ]; then
        service apache2 start
        systemctl status apache2 --no-pager
    else
        ansible --version       # ansible ei ole teenus, näitame versiooni
    fi
fi



