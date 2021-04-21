# [Mylar](https://github.com/evilhero/mylar) is an automated Comic Book
# downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents.

source ./.env
docker run -d \
  --name=mylar \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -p 8090:8090 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/mylar/config:/config `# Where mylar should store config files.` \
  -v ${BASEDIR:-/volume1/docker}/mylar/comics:/comics `# Map to your comics folder.` \
  -v ${BASEDIR:-/volume1/docker}/mylar/downloads:/downloads `# Map to your downloads folder.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/mylar
