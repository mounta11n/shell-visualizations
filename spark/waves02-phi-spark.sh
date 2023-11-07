#!/bin/bash

# Cursor ausblenden
tput civis
# Signal trap, um den Cursor beim Beenden des Skripts wieder einzublenden
trap 'tput cnorm' EXIT

# Daten sequenzen
sequences=(
    '0,1,2,3,5,3,2,1'
    '1,2,3,5,3,2,1,0'
    '2,3,5,3,2,1,0,1'
    '3,5,3,2,1,0,1,2'
    '5,3,2,1,0,1,2,3'
    '3,2,1,0,1,2,3,5'
    '2,1,0,1,2,3,5,3'
    '1,0,1,2,3,5,3,2'
  )
# Schleife über Sequenzen
while true; do
    for seq in "${sequences[@]}"; do
        val=$(spark $seq)
        echo -ne "${val}\r"
        sleep 0.1
    done
done
