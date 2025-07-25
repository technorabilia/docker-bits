# [Transmission](https://www.transmissionbt.com/) is designed for easy, powerful
# use. Transmission has the features you want from a BitTorrent client:
# encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and
# NAT-PMP port forwarding, webseed support, watch directories, tracker editing,
# global and per-torrent speed limits, and more.

. ./.env
docker run -d \
  --name=transmission \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TRANSMISSION_WEB_HOME= `# Specify the path to an alternative UI folder. [OPTIONAL]` \
  -e USER= `# Specify an optional username for the interface [OPTIONAL]` \
  -e PASS= `# Specify an optional password for the interface [OPTIONAL]` \
  -e WHITELIST= `# Specify an optional list of comma separated ip whitelist. Fills rpc-whitelist setting. [OPTIONAL]` \
  -e PEERPORT= `# Specify an optional port for torrent TCP/UDP connections. Fills peer-port setting. [OPTIONAL]` \
  -e HOST_WHITELIST= `# Specify an optional list of comma separated dns name whitelist. Fills rpc-host-whitelist setting. [OPTIONAL]` \
  -p 9091:9091 `# WebUI` \
  -p 51413:51413 `# Torrent Port TCP` \
  -p 51413:51413/udp `# Torrent Port UDP` \
  -v ${BASEDIR:-/srv/lsio}/transmission/config:/config `# Where transmission should store config files and logs.` \
  -v ${BASEDIR:-/srv/lsio}/transmission/downloads:/downloads `# Local path for downloads. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/transmission/watch:/watch `# Watch folder for torrent files. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/transmission:latest
