#!/bin/bash
# Skript väljastab kasutaja tervituse

echo -n "Tere, "
echo -n "$(whoami | cut -c1 | tr 'a-z' 'A-Z')$(whoami | cut -c2-)"
echo " !"
