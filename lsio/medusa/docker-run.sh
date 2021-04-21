# [Medusa](https://pymedusa.com/) is an automatic Video Library Manager for TV
# Shows. It watches for new episodes of your favorite shows, and when they are
# posted it does its magic.

source ./.env
docker run -d \
  --name=medusa \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8081:8081 `# The port for the Medusa webui` \
  -v ${BASEDIR:-/volume1/docker}/medusa/config:/config `# Medusa config` \
  -v ${BASEDIR:-/volume1/docker}/medusa/downloads:/downloads `# Download location` \
  -v ${BASEDIR:-/volume1/docker}/medusa/tv:/tv `# TV Shows location` \
  --restart unless-stopped \
  ghcr.io/linuxserver/medusa
