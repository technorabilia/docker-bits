# [Spotube](https://spotube.krtirtho.dev/) is an open source, cross-platform
# Spotify client compatible across multiple platforms utilizing Spotify's data
# API and YouTube, Piped.video or JioSaavn as an audio source, eliminating the
# need for Spotify Premium

. ./.env
docker run -d \
  --name=spotube \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Spotube desktop gui.` \
  -p 3001:3001 `# HTTPS Spotube desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/spotube/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  ghcr.io/linuxserver/spotube
