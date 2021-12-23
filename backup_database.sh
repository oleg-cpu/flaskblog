#!/bin/sh
backupDir="pg_data/backups_database"

if [ -d "$backupDir" ]; then 
docker exec -u postgres postgres pg_dump -Fc flaskblog > pg_data/backups_database/backup_`date +%d-%m-%Y"_"%H_%M`.sql  
else 
    mkdir pg_data/backups_database
    docker exec -u postgres postgres pg_dump -Fc flaskblog > pg_data/backups_database/backup_`date +%d-%m-%Y"_"%H_%M`.sql
fi
