# [Sonarr](https://sonarr.tv/) (formerly NZBdrone) is a PVR for usenet and
# bittorrent users. It can monitor multiple RSS feeds for new episodes of your
# favorite shows and will grab, sort and rename them. It can also be configured
# to automatically upgrade the quality of files already downloaded when a better
# quality format becomes available.

. ./.env
docker run -d \
  --name=sonarr \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8989:8989 `# The port for the Sonarr web interface` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/config:/config `# Database and sonarr configs` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/tv:/tv `# Location of TV library on disk (See note in Application setup) [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/downloads:/downloads `# Location of download managers output directory (See note in Application setup) [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/sonarr:latest
