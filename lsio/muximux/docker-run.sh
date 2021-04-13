# Muximux is a lightweight portal to view & manage your HTPC apps without having
# to run anything more than a PHP enabled webserver. With Muximux you don't need
# to keep multiple tabs open, or bookmark the URL to all of your apps.

source ./.env
docker run -d \
  --name=muximux \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/muximux/config:/config `# Where muximux should store its files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/muximux
