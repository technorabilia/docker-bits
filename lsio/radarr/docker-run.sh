# [Radarr](https://github.com/Radarr/Radarr) - A fork of Sonarr to work with
# movies à la Couchpotato.

. ./.env
docker run -d \
  --name=radarr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 7878:7878 `# The port for the Radarr Web UI` \
  -v ${BASEDIR:-/volume1/docker}/radarr/config:/config `# Database and Radarr configs` \
  -v ${BASEDIR:-/volume1/docker}/radarr/movies:/movies `# optional` `# Location of Movie library on disk (See note in Application setup)` \
  -v ${BASEDIR:-/volume1/docker}/radarr/downloads:/downloads `# optional` `# Location of download managers output directory (See note in Application setup)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/radarr
