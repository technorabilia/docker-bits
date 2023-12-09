# [Deluge](http://deluge-torrent.org/) is a lightweight, Free Software, cross-
# platform BitTorrent client. * Full Encryption * WebUI * Plugin System * Much
# more...

. ./.env
docker run -d \
  --name=deluge \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DELUGE_LOGLEVEL=error `# optional` `# set the loglevel output when running Deluge, default is info for deluged and warning for delgued-web` \
  -p 8112:8112 `# Port for webui` \
  -p 6881:6881 `# Inbound torrent traffic (See App Setup)` \
  -p 6881:6881/udp `# Inbound torrent traffic (See App Setup)` \
  -p 58846:58846 `# optional` `# Default deluged port for thin client connectivity` \
  -v ${BASEDIR:-/volume1/docker}/deluge/config:/config `# deluge configs` \
  -v ${BASEDIR:-/volume1/docker}/deluge/downloads:/downloads `# torrent download directory` \
  --restart unless-stopped \
  ghcr.io/linuxserver/deluge
