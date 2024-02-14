# [Firefox](https://www.mozilla.org/en-US/firefox/) Browser, also known as
# Mozilla Firefox or simply Firefox, is a free and open-source web browser
# developed by the Mozilla Foundation and its subsidiary, the Mozilla
# Corporation. Firefox uses the Gecko layout engine to render web pages, which
# implements current and anticipated web standards.

. ./.env
docker run -d \
  --name=firefox \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e FIREFOX_CLI=https://www.linuxserver.io/ `# optional` `# Specify one or multiple Firefox CLI flags, this string will be passed to the application in full.` \
  -p 3000:3000 `# Firefox desktop gui.` \
  -p 3001:3001 `# Firefox desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/firefox/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/firefox
