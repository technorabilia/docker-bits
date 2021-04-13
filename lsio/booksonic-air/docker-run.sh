# Booksonic-air is a platform for accessing the audibooks you own wherever you
# are. At the moment the platform consists of Booksonic Air - A server for
# streaming your audiobooks, successor to the original Booksonic server and
# based on Airsonic. Booksonic App - An DSub based Android app for connection to
# Booksonic-Air servers. .

source ./.env
docker run -d \
  --name=booksonic-air \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e CONTEXT_PATH=url-base `# Base url for use with reverse proxies etc.` \
  -p 4040:4040 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/booksonic-air/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic-air/audiobooks:/audiobooks `# Audiobooks.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic-air/podcasts:/podcasts `# Podcasts.` \
  -v ${BASEDIR:-/volume1/docker}/booksonic-air/othermedia:/othermedia `# Other media.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/booksonic-air
