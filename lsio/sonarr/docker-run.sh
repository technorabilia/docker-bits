# [Sonarr](https://sonarr.tv/) (formerly NZBdrone) is a PVR for usenet and
# bittorrent users. It can monitor multiple RSS feeds for new episodes of your
# favorite shows and will grab, sort and rename them. It can also be configured
# to automatically upgrade the quality of files already downloaded when a better
# quality format becomes available.

. ./.env
docker run -d \
  --name=sonarr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8989:8989 `# The port for the Sonarr web interface` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/config:/config `# Database and sonarr configs` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/tv:/tv `# optional` `# Location of TV library on disk (See note in Application setup)` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/downloads:/downloads `# optional` `# Location of download managers output directory (See note in Application setup)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sonarr
