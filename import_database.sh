#!/bin/bash

source config.sh

if [ ! -f sql/database.sql ]; then
  echo '"sql/database.sql" not found, exiting.'
  exit 1
fi

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
  echo 'Importing WordPress database from "sql/database.sql"...'
  docker exec -i $db mysql wordpress --user=root --password=wordpress < sql/database.sql
  echo 'Done, exiting.'
fi
