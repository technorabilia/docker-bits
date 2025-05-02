# [Lidarr](https://github.com/lidarr/Lidarr) is a music collection manager for
# Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks
# from your favorite artists and will grab, sort and rename them. It can also be
# configured to automatically upgrade the quality of files already downloaded
# when a better quality format becomes available.

. ./.env
docker run -d \
  --name=lidarr \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8686:8686 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/lidarr/config:/config `# Configuration files for Lidarr.` \
  -v ${BASEDIR:-/volume1/docker}/lidarr/music:/music `# Music files (See note in Application setup). [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/lidarr/downloads:/downloads `# Path to your download folder for music (See note in Application setup). [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/lidarr:latest
