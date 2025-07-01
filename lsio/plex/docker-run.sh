# [Plex](https://plex.tv) organizes video, music and photos from personal media
# libraries and streams them to smart TVs, streaming boxes and mobile devices.
# This container is packaged as a standalone Plex Media Server. Straightforward
# design and bulk actions mean getting things done faster.

. ./.env
docker run -d \
  --name=plex \
  --net=host `# Use Host Networking` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VERSION=docker `# Set whether to update plex or not - see Application Setup section.` \
  -e PLEX_CLAIM= `# Optionally you can obtain a claim token from https://plex.tv/claim and input here. Keep in mind that the claim tokens expire within 4 minutes. [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/plex/config:/config `# Plex library location. *This can grow very large, 50gb+ is likely for a large collection.*` \
  -v ${BASEDIR:-/srv/lsio}/plex/tv:/tv `# Media goes here. Add as many as needed e.g. `/movies`, `/tv`, etc.` \
  -v ${BASEDIR:-/srv/lsio}/plex/movies:/movies `# Media goes here. Add as many as needed e.g. `/movies`, `/tv`, etc.` \
  --restart unless-stopped \
  lscr.io/linuxserver/plex:latest
