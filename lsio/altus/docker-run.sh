# [Altus](https://github.com/amanharwara/altus) is an Electron-based WhatsApp
# client with themes and multiple account support.

. ./.env
docker run -d \
  --name=altus \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Altus desktop gui.` \
  -p 3001:3001 `# Altus desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/altus/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/altus
