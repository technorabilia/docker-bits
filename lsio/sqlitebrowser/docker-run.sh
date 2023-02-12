# [DB Browser for SQLite](https://sqlitebrowser.org/) is a high quality, visual,
# open source tool to create, design, and edit database files compatible with
# SQLite.

source ./.env
docker run -d \
  --name=sqlitebrowser \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Sqlitebrowser desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/sqlitebrowser/config:/config `# Users home directory in the container, stores program settings and potentially dump files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sqlitebrowser
