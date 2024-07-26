# [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium)
# is Google Chromium, sans dependency on Google web services.

. ./.env
docker run -d \
  --name=ungoogled-chromium \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CHROME_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# Ungoogled Chromium desktop gui.` \
  -p 3001:3001 `# HTTPS Ungoogled Chromium desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/ungoogled-chromium/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/ungoogled-chromium
