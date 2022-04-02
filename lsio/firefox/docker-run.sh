# [Firefox](https://www.mozilla.org/en-US/firefox/) Browser, also known as
# Mozilla Firefox or simply Firefox, is a free and open-source web browser
# developed by the Mozilla Foundation and its subsidiary, the Mozilla
# Corporation. Firefox uses the Gecko layout engine to render web pages, which
# implements current and anticipated web standards.

source ./.env
docker run -d \
  --name=firefox \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Firefox desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/firefox/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  ghcr.io/linuxserver/firefox
