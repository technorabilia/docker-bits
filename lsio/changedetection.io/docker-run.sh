# [Changedetection.io](https://github.com/dgtlmoon/changedetection.io) provides
# free, open-source web page monitoring, notification and change detection.

. ./.env
docker run -d \
  --name=changedetection.io \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e BASE_URL= `# Specify the full URL (including protocol) when running behind a reverse proxy [OPTIONAL]` \
  -e PLAYWRIGHT_DRIVER_URL= `# Specify the full URL to your chrome driver instance. See the [wiki](https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher) for details. [OPTIONAL]` \
  -p 5000:5000 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/changedetection.io/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/changedetection.io:latest
