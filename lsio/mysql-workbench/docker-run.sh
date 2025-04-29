# [MySQL Workbench](https://www.mysql.com/products/workbench/) is a unified
# visual tool for database architects, developers, and DBAs. MySQL Workbench
# provides data modeling, SQL development, and comprehensive administration
# tools for server configuration, user administration, backup, and much more.

. ./.env
docker run -d \
  --name=mysql-workbench \
  --cap-add=IPC_LOCK \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Mysql Workbench desktop gui.` \
  -p 3001:3001 `# Mysql Workbench desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/mysql-workbench/config:/config `# Users home directory in the container, stores program settings.` \
  --restart unless-stopped \
  lscr.io/linuxserver/mysql-workbench:latest
