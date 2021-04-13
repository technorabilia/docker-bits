# THIS IMAGE IS DEPRECATED. PLEASE MIGRATE TO CLOUD9 IF POSSIBLE
# `linuxserver/cloud9` Codiad is a web-based IDE framework with a small
# footprint and minimal requirements. We have added a few plugins. More can be
# added in the marketplace in the WebUI.

source ./.env
docker run -d \
  --name=codiad \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/codiad/config:/config `# Where Codiad stores data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/codiad
