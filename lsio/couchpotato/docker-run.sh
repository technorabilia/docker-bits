# Couchpotato is an automatic NZB and torrent downloader. You can keep a `movies
# I want` list and it will search for NZBs/torrents of these movies every X
# hours. Once a movie is found, it will send it to SABnzbd or download the
# torrent to a specified directory.

source ./.env
docker run -d \
  --name=couchpotato \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 5050:5050 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/couchpotato/config:/config `# Couchpotato Application Data.` \
  -v ${BASEDIR:-/volume1/docker}/couchpotato/downloads:/downloads `# Downloads Folder.` \
  -v ${BASEDIR:-/volume1/docker}/couchpotato/movies:/movies `# Movie Share.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/couchpotato
