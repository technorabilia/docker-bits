# [LibreWolf](https://librewolf.net/) is a custom and independent version of
# Firefox, with the primary goals of privacy, security and user freedom.
# LibreWolf also aims to remove all the telemetry, data collection and
# annoyances, as well as disabling anti-freedom features like DRM.

. ./.env
docker run -d \
  --name=librewolf \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e LIBREWOLF_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple LibreWolf CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# LibreWolf desktop gui.` \
  -p 3001:3001 `# LibreWolf desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/librewolf/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/librewolf
