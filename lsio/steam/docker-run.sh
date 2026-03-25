# [Steam](https://store.steampowered.com/) is the ultimate destination for
# playing, discussing, and creating games.

. ./.env
docker run -d \
  --name=steam \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Steam desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# Steam desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/steam/config:/config `# Users home directory in the container, stores all files and games.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/steam:latest
