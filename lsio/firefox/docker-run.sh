# [Firefox](https://www.mozilla.org/en-US/firefox/) Browser, also known as
# Mozilla Firefox or simply Firefox, is a free and open-source web browser
# developed by the Mozilla Foundation and its subsidiary, the Mozilla
# Corporation. Firefox uses the Gecko layout engine to render web pages, which
# implements current and anticipated web standards.

. ./.env
docker run -d \
  --name=firefox \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=Europe/London `# Specify a timezone to use EG Europe/London.` \
  -e FIREFOX_CLI=https://www.linuxserver.io/ `# Specify one or multiple Firefox CLI flags, this string will be passed to the application in full. [OPTIONAL]` \
  -p 3000:3000 `# Firefox desktop gui.` \
  -p 3001:3001 `# Firefox desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/firefox/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/firefox:latest
