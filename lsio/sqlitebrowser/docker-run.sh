# [DB Browser for SQLite](https://sqlitebrowser.org/) is a high quality, visual,
# open source tool to create, design, and edit database files compatible with
# SQLite.

. ./.env
docker run -d \
  --name=sqlitebrowser \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Sqlitebrowser desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Sqlitebrowser desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/sqlitebrowser/config:/config `# Users home directory in the container, stores program settings and potentially dump files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/sqlitebrowser:latest
