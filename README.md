# Beanstalk

Simple WordPress Docker setup using MariaDB with import/export SQL scripts for Jack.

## Getting started

Requires Docker

Run `./init.sh` to automatically edit `config.sh` to create unique slug for project. This only needs to be done once.

Run `./run.sh` to start the WordPress and MariaDB container named using your unique slug.

WordPress will be located in the `wordpress` directory.

WordPress will be running at [http://localhost/](http://localhost/).

The default WordPress user/password is `admin`.

Most WordPress files will be ignored by Git except for new `themes`, `plugins` or `uploads`. Uploads will be commited using LFS.

## Import/Export WordPress database (as the database will be lost if the Docker volume/container is destroyed)

Run `./export_database.sh` to export the database to `sql/database.sql`.

Run `./import_database.sh` to import the database from `sql/database.sql`.
