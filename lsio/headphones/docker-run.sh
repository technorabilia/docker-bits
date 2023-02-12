# [Headphones](https://github.com/rembo10/headphones) is an automated music
# downloader for NZB and Torrent, written in Python. It supports SABnzbd,
# NZBget, Transmission, µTorrent and Blackhole.

source ./.env
docker run -d \
  --name=headphones \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8181:8181 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/headphones/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/headphones/downloads:/downloads `# ISOs.` \
  -v ${BASEDIR:-/volume1/docker}/headphones/music:/music `# Your music directory.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/headphones
