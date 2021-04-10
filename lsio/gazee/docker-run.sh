# THIS IMAGE IS DEPRECATED, IT WILL NO LONGER RECEIVE UPDATES. Gazee is a WebApp
# Comic Reader for your favorite digital comics. Reach and read your comic
# library from any web connected device with a modern web browser.

source ./.env
docker run -d \
  --name=gazee \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -p 4242:4242 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/gazee/config:/config `# Where Gazee should store config files.` \
  -v ${BASEDIR:-/volume1/docker}/gazee/comics:/comics `# Path to comics folder.` \
  -v ${BASEDIR:-/volume1/docker}/gazee/mylar:/mylar `# Path to Mylar DB.` \
  -v ${BASEDIR:-/volume1/docker}/gazee/certs:/certs `# Where SSL certs should be stored.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/gazee
