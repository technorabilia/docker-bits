# Mylar3 is an automated Comic Book downloader (cbr/cbz) for use with NZB and
# torrents written in python. It supports SABnzbd, NZBGET, and many torrent
# clients in addition to DDL.

source ./.env
docker run -d \
  --name=mylar3 \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -p 8090:8090 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/mylar3/config:/config `# Where mylar should store config files.` \
  -v ${BASEDIR:-/volume1/docker}/mylar3/comics:/comics `# Map to your comics folder.` \
  -v ${BASEDIR:-/volume1/docker}/mylar3/downloads:/downloads `# Map to your downloads folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/mylar3
