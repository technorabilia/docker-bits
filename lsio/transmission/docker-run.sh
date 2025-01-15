# [Transmission](https://www.transmissionbt.com/) is designed for easy, powerful
# use. Transmission has the features you want from a BitTorrent client:
# encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and
# NAT-PMP port forwarding, webseed support, watch directories, tracker editing,
# global and per-torrent speed limits, and more.

. ./.env
docker run -d \
  --name=transmission \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TRANSMISSION_WEB_HOME= `# optional` `# Specify the path to an alternative UI folder.` \
  -e USER= `# optional` `# Specify an optional username for the interface` \
  -e PASS= `# optional` `# Specify an optional password for the interface` \
  -e WHITELIST= `# optional` `# Specify an optional list of comma separated ip whitelist. Fills rpc-whitelist setting.` \
  -e PEERPORT= `# optional` `# Specify an optional port for torrent TCP/UDP connections. Fills peer-port setting.` \
  -e HOST_WHITELIST= `# optional` `# Specify an optional list of comma separated dns name whitelist. Fills rpc-host-whitelist setting.` \
  -p 9091:9091 `# WebUI` \
  -p 51413:51413 `# Torrent Port TCP` \
  -p 51413:51413/udp `# Torrent Port UDP` \
  -v ${BASEDIR:-/volume1/docker}/transmission/config:/config `# Where transmission should store config files and logs.` \
  -v ${BASEDIR:-/volume1/docker}/transmission/downloads:/downloads `# optional` `# Local path for downloads.` \
  -v ${BASEDIR:-/volume1/docker}/transmission/watch:/watch `# optional` `# Watch folder for torrent files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/transmission
