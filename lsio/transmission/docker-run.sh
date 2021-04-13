# Transmission is designed for easy, powerful use. Transmission has the features
# you want from a BitTorrent client: encryption, a web interface, peer exchange,
# magnet links, DHT, µTP, UPnP and NAT-PMP port forwarding, webseed support,
# watch directories, tracker editing, global and per-torrent speed limits, and
# more.

source ./.env
docker run -d \
  --name=transmission \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e TRANSMISSION_WEB_HOME=/combustion-release/ `# optional` `# Specify an alternative UI options are `/combustion-release/`, `/transmission-web-control/`, and `/kettu/` .` \
  -e USER=username `# optional` `# Specify an optional username for the interface` \
  -e PASS=password `# optional` `# Specify an optional password for the interface` \
  -e WHITELIST=iplist `# optional` `# Specify an optional list of comma separated ip whitelist. Fill rpc-whitelist setting.` \
  -e HOST_WHITELIST=dnsnane list `# optional` `# Specify an optional list of comma separated dns name whitelist. Fill rpc-host-whitelist setting.` \
  -p 9091:9091 `# WebUI` \
  -p 51413:51413 `# Torrent Port TCP` \
  -p 51413:51413/udp `# Torrent Port UDP` \
  -v ${BASEDIR:-/volume1/docker}/transmission/config:/config `# Where transmission should store config files and logs.` \
  -v ${BASEDIR:-/volume1/docker}/transmission/downloads:/downloads `# Local path for downloads.` \
  -v ${BASEDIR:-/volume1/docker}/transmission/watch:/watch `# Watch folder for torrent files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/transmission
