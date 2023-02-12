# [Heimdall](https://heimdall.site) is a way to organise all those links to your
# most used web sites and web applications in a simple way. Simplicity is the
# key to Heimdall. Why not use it as your browser start page? It even has the
# ability to include a search bar using either Google, Bing or DuckDuckGo.

source ./.env
docker run -d \
  --name=heimdall \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/heimdall/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/heimdall
