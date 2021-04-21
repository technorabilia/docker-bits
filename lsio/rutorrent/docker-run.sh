# [Rutorrent](https://github.com/Novik/ruTorrent) is a popular rtorrent client
# with a webui for ease of use.

source ./.env
docker run -d \
  --name=rutorrent \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# ruTorrent Web UI` \
  -p 5000:5000 `# scgi port` \
  -p 51413:51413 `# Bit-torrent port` \
  -p 6881:6881/udp `# Bit-torrent port` \
  -v ${BASEDIR:-/volume1/docker}/rutorrent/config:/config `# where ruTorrent should store it's config files` \
  -v ${BASEDIR:-/volume1/docker}/rutorrent/downloads:/downloads `# path to your downloads folder` \
  --restart unless-stopped \
  ghcr.io/linuxserver/rutorrent
