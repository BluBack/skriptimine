

#!/bin/bash
BACKUP_i tegemiseks skript
echo "See skript teeb kataloogi varunduse (backup_i). Täpsemalt: kasutades tar pakib ja surub kokku."
sleep 2
echo "Sisesta, palun, kataloogi nimi mille varunduse soovid teha."
echo -n "Katalooi nimi terve_teega/asukohaga (näiteks:/home/user/dir/):"
read kataloog
echo "Kataloogi #kataloog varundamine!"
sleep 1
cd $kataloog
cd ..
aeg=`date +"M\d\m\y"`
baasnimi "basename $kataloog
backupfailinimi-sbaasnimi.backup.$aeg.tar.gz
tar -czf $backupfailinimi baasnimi
my $backupfailinimi /home/user/skriptimine/backup/
echo "Kataloogi kataloog backup_i nimi on $backupfailinimi ja ta asub /home/user/skriptimine/backup/ kataloog$
