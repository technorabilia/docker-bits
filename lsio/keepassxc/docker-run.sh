# [KeePassXC](https://keepassxc.org/) is a free and open-source password
# manager. It started as a community fork of KeePassX (itself a cross-platform
# port of KeePass).

. ./.env
docker run -d \
  --name=keepassxc \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# KeePassXC desktop gui.` \
  -p 3001:3001 `# KeePassXC desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/keepassxc/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  ghcr.io/linuxserver/keepassxc
