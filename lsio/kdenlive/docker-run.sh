# [Kdenlive](https://kdenlive.org/) is a powerful free and open source cross-
# platform video editing program made by the KDE community. Feature rich and
# production ready.

. ./.env
docker run -d \
  --name=kdenlive \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder to use with reverse proxies, IE `/subfolder/`` \
  -p 3000:3000 `# Kdenlive desktop gui` \
  -p 3001:3001 `# Kdenlive desktop gui HTTPS` \
  -v ${BASEDIR:-/volume1/docker}/kdenlive/config:/config `# Users home directory in the container, stores local files and settings` \
  --device /dev/dri:/dev/dri `# optional` `# Add this for hardware acceleration (Linux hosts only)` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kdenlive
