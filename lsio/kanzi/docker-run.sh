# [Kanzi](https://lexigr.am/), formerly titled Kodi-Alexa, this custom skill is
# the ultimate voice remote control for navigating Kodi. It can do anything you
# can think of (100+ intents). This container also contains lexigram-cli to
# setup Kanzi with an Amazon Developer Account and automatically deploy it to
# Amazon.

source ./.env
docker run -d \
  --name=kanzi \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e INVOCATION_NAME=kanzi `# Specify an invocation name for this skill, use either kanzi or kod.` \
  -e URL_ENDPOINT=https://server.com/kanzi/ `# Specify the URL at which the webserver is reachable either `https://kanzi.server.com/` or `https://server.com/kanzi/` Note the trailing slash **MUST** be included.` \
  -p 8000:8000 `# Application Port` \
  -v ${BASEDIR:-/volume1/docker}/kanzi/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kanzi
