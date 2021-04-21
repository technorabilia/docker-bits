# [Booksonic](http://booksonic.org) is a server and an app for streaming your
# audiobooks to any pc or android phone. Most of the functionality is also
# availiable on other platforms that have apps for subsonic.

source ./.env
docker run -d \
  --name=booksonic \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONTEXT_PATH=url-base `# Base url for use with reverse proxies etc.` \
  -p 4040:4040 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/booksonic/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic/audiobooks:/audiobooks `# Audiobooks.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic/podcasts:/podcasts `# Podcasts.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic/othermedia:/othermedia `# Other media.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/booksonic
