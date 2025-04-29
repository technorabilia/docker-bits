# [Heimdall](https://heimdall.site) is a way to organise all those links to your
# most used web sites and web applications in a simple way. Simplicity is the
# key to Heimdall. Why not use it as your browser start page? It even has the
# ability to include a search bar using either Google, Bing or DuckDuckGo.

. ./.env
docker run -d \
  --name=heimdall \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/heimdall/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
