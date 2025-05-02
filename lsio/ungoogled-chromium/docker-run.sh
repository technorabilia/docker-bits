# [Ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium)
# is Google Chromium, sans dependency on Google web services.

. ./.env
docker run -d \
  --name=ungoogled-chromium \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CHROME_CLI=https://www.linuxserver.io/ `# Specify one or multiple Chromium CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# Ungoogled Chromium desktop gui.` \
  -p 3001:3001 `# HTTPS Ungoogled Chromium desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/ungoogled-chromium/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/ungoogled-chromium:latest
