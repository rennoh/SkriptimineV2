#!/bin/bash
# Skript väljastab tänase kuupäeva kellaaja ja kalendri

echo "Today is $(date +"%A, %B %d, %Y")"
echo "Time is $(date +"%H:%M")"
echo ""
echo "Calendar of $(date +"%B %Y")"
ncal -b
