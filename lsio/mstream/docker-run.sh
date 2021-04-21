# [Mstream](https://mstream.io/) is a personal music streaming server. You can
# use mStream to stream your music from your home computer to any device,
# anywhere. There are mobile apps available for both Android and iPhone.

source ./.env
docker run -d \
  --name=mstream \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e USER=admin `# Set username to login` \
  -e PASSWORD=password `# Set password for user` \
  -e USE_JSON=true/false `# Run mStream using the config specified at `/config/config.json`, note this will mean user/password is defined in `config.json`` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# The port for the mStream webinterface` \
  -v ${BASEDIR:-/volume1/docker}/mstream/config:/config `# mStream config` \
  -v ${BASEDIR:-/volume1/docker}/mstream/music:/music `# Music location` \
  --restart unless-stopped \
  ghcr.io/linuxserver/mstream
