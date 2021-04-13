# The Qbittorrent project aims to provide an open-source software alternative to
# µTorrent. qBittorrent is based on the Qt toolkit and libtorrent-rasterbar
# library.

source ./.env
docker run -d \
  --name=qbittorrent \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e WEBUI_PORT=8080 `# for changing the port of the webui, see below for explanation` \
  -p 6881:6881 `# tcp connection port` \
  -p 6881:6881/udp `# udp connection port` \
  -p 8080:8080 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/qbittorrent/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/qbittorrent/downloads:/downloads `# Location of downloads on disk.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/qbittorrent
