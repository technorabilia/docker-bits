# [melonDS](https://melonds.kuribo64.net/) aims at providing fast and accurate
# Nintendo DS emulation.

. ./.env
docker run -d \
  --name=melonds \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# melonDS desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# melonDS desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/melonds/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/melonds:latest
