# [Mariadb](https://mariadb.org/) is one of the most popular database servers.
# Made by the original developers of MySQL.

. ./.env
docker run -d \
  --name=mariadb \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MYSQL_ROOT_PASSWORD=ROOT_ACCESS_PASSWORD `# Set this to root password for installation (minimum 4 characters & non-alphanumeric passwords must be properly escaped). (valid only for first run)` \
  -e MYSQL_DATABASE=USER_DB_NAME `# optional` `# Specify the name of a database to be created. (valid only for first run)` \
  -e MYSQL_USER=MYSQL_USER `# optional` `# This user will have superuser access to the database specified by MYSQL_DATABASE (do not use root here). (valid only for first run)` \
  -e MYSQL_PASSWORD=DATABASE_PASSWORD `# optional` `# Set this to the password you want to use for you MYSQL_USER (minimum 4 characters & non-alphanumeric passwords must be properly escaped). (valid only for first run)` \
  -e REMOTE_SQL=http://URL1/your.sql,https://URL2/your.sql `# optional` `# Set this to ingest sql files from an http/https endpoint (comma seperated array).` \
  -p 3306:3306 `# MariaDB listens on this port.` \
  -v ${BASEDIR:-/volume1/docker}/mariadb/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/mariadb
