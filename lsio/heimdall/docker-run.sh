# [Heimdall](https://heimdall.site) is a way to organise all those links to your
# most used web sites and web applications in a simple way. Simplicity is the
# key to Heimdall. Why not use it as your browser start page? It even has the
# ability to include a search bar using either Google, Bing or DuckDuckGo.

. ./.env
docker run -d \
  --name=heimdall \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e ALLOW_INTERNAL_REQUESTS=false `# By default, Heimdall blocks lookup requests to private or reserved IP addresses, if your instance is not exposed to the internet, or is behind some level of authentication, you can set this to `true` to allow requests to private IP addresses. [OPTIONAL]` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/srv/lsio}/heimdall/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
