# [PairDrop](https://github.com/schlagmichdoch/PairDrop) is a sublime
# alternative to AirDrop that works on all platforms. Send images, documents or
# text via peer to peer connection to devices in the same local network/Wi-Fi or
# to paired devices.

. ./.env
docker run -d \
  --name=pairdrop \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e RATE_LIMIT=false `# optional` `# Set to `true` to limit clients to 100 requests per 5 min` \
  -e WS_FALLBACK=false `# optional` `# Set to `true` to enable websocket fallback if the peer to peer WebRTC connection is not available to the client (see App Setup notes).` \
  -e RTC_CONFIG= `# optional` `# Path to a json file containing custom STUN/TURN config (see App Setup notes)` \
  -e DEBUG_MODE=false `# optional` `# Set to `true` to debug the http server configuration by logging clients IP addresses used by PairDrop to STDOUT. [See here for more info](https://github.com/schlagmichdoch/PairDrop/blob/master/docs/host-your-own.md#debug-mode). Do not use in production!` \
  -p 3000:3000 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/pairdrop/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pairdrop
