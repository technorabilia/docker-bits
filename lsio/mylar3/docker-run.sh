# [Mylar3](https://github.com/mylar3/mylar3) is an automated Comic Book
# downloader (cbr/cbz) for use with NZB and torrents written in python. It
# supports SABnzbd, NZBGET, and many torrent clients in addition to DDL.

. ./.env
docker run -d \
  --name=mylar3 \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8090:8090 `# WebUI` \
  -v ${BASEDIR:-/srv/lsio}/mylar3/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/mylar3/comics:/comics `# Map to your comics folder.` \
  -v ${BASEDIR:-/srv/lsio}/mylar3/downloads:/downloads `# Map to your downloads folder.` \
  --restart unless-stopped \
  lscr.io/linuxserver/mylar3:latest
