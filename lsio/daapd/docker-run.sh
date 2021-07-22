# [Daapd](https://owntone.github.io/owntone-server/) (iTunes) media server with
# support for AirPlay devices, Apple Remote (and compatibles), Chromecast, MPD
# and internet radio.

source ./.env
docker run -d \
  --name=daapd \
  --net=host `# Shares host networking with container.` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -v ${BASEDIR:-/volume1/docker}/daapd/config:/config `# Where daapd server stores its config and dbase files.` \
  -v ${BASEDIR:-/volume1/docker}/daapd/music:/music `# Map to your music folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/daapd
