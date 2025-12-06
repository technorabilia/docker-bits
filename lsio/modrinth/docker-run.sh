# [Modrinth App](https://modrinth.com/) is a unique, open source launcher that
# allows you to play your favorite mods, and keep them up to date, all in one
# neat little package.

. ./.env
docker run -d \
  --name=modrinth \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Modrinth desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Modrinth desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/modrinth/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/modrinth:latest
