# [Hydra](https://github.com/theotherp/nzbhydra) is a meta search for NZB
# indexers and the 'spiritual successor' to NZBmegasearcH. It provides easy
# access to a number of raw and newznab based indexers.

source ./.env
docker run -d \
  --name=hydra \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 5075:5075 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/hydra/config:/config `# Where hydra should store config files.` \
  -v ${BASEDIR:-/volume1/docker}/hydra/downloads:/downloads `# NZB download folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/hydra
