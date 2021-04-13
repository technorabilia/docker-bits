# Deluge is a lightweight, Free Software, cross-platform BitTorrent client.  *
# Full Encryption * WebUI * Plugin System * Much more...

source ./.env
docker run -d \
  --name=deluge \
  --net=host `# Shares host networking with container, **required**.` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e DELUGE_LOGLEVEL=error `# optional` `# set the loglevel output when running Deluge, default is info for deluged and warning for delgued-web` \
  -v ${BASEDIR:-/volume1/docker}/deluge/config:/config `# deluge configs` \
  -v ${BASEDIR:-/volume1/docker}/deluge/downloads:/downloads `# torrent download directory` \
  --restart unless-stopped \
  ghcr.io/linuxserver/deluge
