# The [Qbittorrent](https://www.qbittorrent.org/) project aims to provide an
# open-source software alternative to µTorrent. qBittorrent is based on the Qt
# toolkit and libtorrent-rasterbar library.

. ./.env
docker run -d \
  --name=qbittorrent \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e WEBUI_PORT=8080 `# for changing the port of the web UI, see below for explanation` \
  -e TORRENTING_PORT=6881 `# for changing the port of tcp/udp connection, see below for explanation` \
  -p 8080:8080 `# WebUI` \
  -p 6881:6881 `# tcp connection port` \
  -p 6881:6881/udp `# udp connection port` \
  -v ${BASEDIR:-/volume1/docker}/qbittorrent/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/qbittorrent/downloads:/downloads `# optional` `# Location of downloads on disk.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/qbittorrent
