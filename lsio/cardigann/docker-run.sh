# THIS IMAGE IS DEPRECATED. We will no longer be making updates or rebuilding
# this image. The Dockerhub endpoint will stay online with the current tags for
# this software. We recommend current users switch to linuxserver/jackett.
# Cardigann a server for adding extra indexers to Sonarr, SickRage and
# CouchPotato via Torznab and TorrentPotato proxies. Behind the scenes Cardigann
# logs in and runs searches and then transforms the results into a compatible
# format.

source ./.env
docker run -d \
  --name=cardigann \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e SOCKS_PROXY=IP:PORT `# for using a socks proxy (optional)` \
  -e HTTP_PROXY=IP:PORT `# for using a HTTP proxy (optional)` \
  -p 5060:5060 `# The port for the Cardigann webinterface` \
  -v ${BASEDIR:-/volume1/docker}/cardigann/config:/config `# Cardigann config` \
  --restart unless-stopped \
  ghcr.io/linuxserver/cardigann
