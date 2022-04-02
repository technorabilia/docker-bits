# [Mstream](https://mstream.io/) is a personal music streaming server. You can
# use mStream to stream your music from your home computer to any device,
# anywhere. There are mobile apps available for both Android and iPhone.

source ./.env
docker run -d \
  --name=mstream \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# The port for the mStream webinterface` \
  -v ${BASEDIR:-/volume1/docker}/mstream/config:/config `# mStream config` \
  -v ${BASEDIR:-/volume1/docker}/mstream/music:/music `# Music location` \
  --restart unless-stopped \
  ghcr.io/linuxserver/mstream
