# [Budge](https://github.com/linuxserver/budge) is an open source 'budgeting
# with envelopes' personal finance app.

source ./.env
docker run -d \
  --name=budge \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/budge/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/budge
