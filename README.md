# Beanstalk

Simple WordPress Docker setup using MariaDB with import/export SQL scripts for Jack.

## Getting started

Requires Docker

Run `./init.sh` to automatically edit `config.sh` to create unique slug for project.

Then run `./run.sh`, WordPress will be running at [http://localhost/](http://localhost/).

## Import/Export WordPress database

Run `./export_database.sh` to export the database to `sql/database.sql`.

Run `./import_database.sh` to import the database from `sql/database.sql`.
