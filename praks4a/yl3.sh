#!/bin/bash
#skript backupi tegemiseks
echo "=========[BACKUP]========='
echo -n "Sisesta kataloogi nimi:"
read katalooginimi
date=$(date + "%d.\m.\Y")
aeg=$(date +"R")
baasnimi "$(basename $katalooginimi)" #võtame katalooginimest ainult baasnime
asukoht="/home/user/skriptimine/praks4a/backup/baasnimi.backup.$aeg.$dat
e.tar.gz" #backupi asukoht
tar -zcvf $asukoht katalooginimi #loome kokkupakitud faili
echo "Kataloogi skatalooginimi backup'i nimi on sbaasnimi.backup.$aeg. $date.tar.gz ja ta asub $asukoht"
echo
#skripti lõpp
