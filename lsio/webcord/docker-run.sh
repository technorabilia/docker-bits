# [WebCord](https://github.com/SpacingBat3/WebCord) can be summarized as a pack
# of security and privacy hardenings, Discord features reimplementations,
# Electron / Chromium / Discord bugs workarounds, stylesheets, internal pages
# and wrapped https://discord.com page, designed to conform with ToS as much as
# it is possible (or hide the changes that might violate it from Discord's
# eyes).

. ./.env
docker run -d \
  --name=webcord \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# WebCord desktop gui.` \
  -p 3001:3001 `# WebCord desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/webcord/config:/config `# Users home directory in the container, stores program settings.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/webcord:latest
