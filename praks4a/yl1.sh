#!/bin/bash

# See skript küsib kasutajalt nime, tervitab teda ning arvutab tema vanuse

echo "Sisesta oma nimi:"
read nimi
echo "Tere tulemast, $nimi!"
echo "Sisesta oma sünniaasta:"
read synniaasta
aasta=$(date +"%Y")
vanus=$(($aasta - $synniaasta))

echo "$nimi, sina oled $vanus aasta vana." 
