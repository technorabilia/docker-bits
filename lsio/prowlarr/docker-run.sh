# [Prowlarr](https://github.com/Prowlarr/Prowlarr) is a indexer manager/proxy
# built on the popular arr .net/reactjs base stack to integrate with your
# various PVR apps. Prowlarr supports both Torrent Trackers and Usenet Indexers.
# It integrates seamlessly with Sonarr, Radarr, Lidarr, and Readarr offering
# complete management of your indexers with no per app Indexer setup required
# (we do it all).

source ./.env
docker run -d \
  --name=prowlarr \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 9696:9696 `# The port for the Prowlarr webinterface` \
  -v ${BASEDIR:-/volume1/docker}/prowlarr/config:/config `# Database and Prowlarr configs` \
  --restart unless-stopped \
  ghcr.io/linuxserver/prowlarr
