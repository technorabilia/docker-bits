# Sonarr (formerly NZBdrone) is a PVR for usenet and bittorrent users. It can
# monitor multiple RSS feeds for new episodes of your favorite shows and will
# grab, sort and rename them. It can also be configured to automatically upgrade
# the quality of files already downloaded when a better quality format becomes
# available.

source ./.env
docker run -d \
  --name=sonarr \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8989:8989 `# The port for the Sonarr webinterface` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/config:/config `# Database and sonarr configs` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/tv:/tv `# Location of TV library on disk (See note in Application setup)` \
  -v ${BASEDIR:-/volume1/docker}/sonarr/downloads:/downloads `# Location of download managers output directory (See note in Application setup)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sonarr
