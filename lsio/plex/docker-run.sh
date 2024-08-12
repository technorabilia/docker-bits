# [Plex](https://plex.tv) organizes video, music and photos from personal media
# libraries and streams them to smart TVs, streaming boxes and mobile devices.
# This container is packaged as a standalone Plex Media Server. Straightforward
# design and bulk actions mean getting things done faster.

. ./.env
docker run -d \
  --name=plex \
  --net=host `# Use Host Networking` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VERSION=docker `# Set whether to update plex or not - see Application Setup section.` \
  -e PLEX_CLAIM= `# optional` `# Optionally you can obtain a claim token from https://plex.tv/claim and input here. Keep in mind that the claim tokens expire within 4 minutes.` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/plex/config:/config `# Plex library location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/volume1/docker}/plex/tv:/tv `# Media goes here. Add as many as needed e.g. `/movies`, `/tv`, etc.` \
  -v ${BASEDIR:-/volume1/docker}/plex/movies:/movies `# Media goes here. Add as many as needed e.g. `/movies`, `/tv`, etc.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex
