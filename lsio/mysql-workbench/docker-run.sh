# [MySQL Workbench](https://www.mysql.com/products/workbench/) is a unified
# visual tool for database architects, developers, and DBAs. MySQL Workbench
# provides data modeling, SQL development, and comprehensive administration
# tools for server configuration, user administration, backup, and much more.

source ./.env
docker run -d \
  --name=mysql-workbench \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Mysql Workbench desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/mysql-workbench/config:/config `# Users home directory in the container, stores program settings.` \
  --cap-add="IPC_LOCK" \
  --restart unless-stopped \
  ghcr.io/linuxserver/mysql-workbench
