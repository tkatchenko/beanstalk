#!/bin/bash

source config.sh

lineCount=$(docker-compose -p "$NAME" ps -q db | wc -l)

echo 'Checking for instance(s) of db...'
if [ $lineCount -eq 0 ]; then
  echo 'No instances of db detected, exiting.'
  exit 1
elif [ $lineCount -gt 1 ]; then
  echo 'More than one instance of db detected, exiting.'
  exit 1
else
  db=$(docker-compose -p "$NAME" ps -q db | head -1)
  echo 'One instance of db detected.'
  echo 'Exporting WordPress database to "sql/database.sql"...'
  docker exec $db mysqldump --databases wordpress --user=root --password=wordpress --add-drop-database > sql/database.sql
  echo 'Done, exiting.'
fi
