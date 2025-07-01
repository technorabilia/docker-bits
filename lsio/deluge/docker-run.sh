# [Deluge](http://deluge-torrent.org/) is a lightweight, Free Software, cross-
# platform BitTorrent client. * Full Encryption * WebUI * Plugin System * Much
# more...

. ./.env
docker run -d \
  --name=deluge \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e DELUGE_LOGLEVEL=error `# set the loglevel output when running Deluge, default is info for deluged and warning for delgued-web [OPTIONAL]` \
  -p 8112:8112 `# Port for webui` \
  -p 6881:6881 `# Inbound torrent traffic (See App Setup)` \
  -p 6881:6881/udp `# Inbound torrent traffic (See App Setup)` \
  -p 58846:58846 `# Default deluged port for thin client connectivity [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/deluge/config:/config `# deluge configs` \
  -v ${BASEDIR:-/srv/lsio}/deluge/downloads:/downloads `# torrent download directory` \
  --restart unless-stopped \
  lscr.io/linuxserver/deluge:latest
