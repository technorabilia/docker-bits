# [PairDrop](https://github.com/schlagmichdoch/PairDrop) is a sublime
# alternative to AirDrop that works on all platforms. Send images, documents or
# text via peer to peer connection to devices in the same local network/Wi-Fi or
# to paired devices.

. ./.env
docker run -d \
  --name=pairdrop \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e RATE_LIMIT=false `# Set to `true` to limit clients to 100 requests per 5 min [OPTIONAL]` \
  -e WS_FALLBACK=false `# Set to `true` to enable websocket fallback if the peer to peer WebRTC connection is not available to the client (see App Setup notes). [OPTIONAL]` \
  -e RTC_CONFIG= `# Path to a json file containing custom STUN/TURN config (see App Setup notes) [OPTIONAL]` \
  -e DEBUG_MODE=false `# Set to `true` to debug the http server configuration by logging clients IP addresses used by PairDrop to STDOUT. [See here for more info](https://github.com/schlagmichdoch/PairDrop/blob/master/docs/host-your-own.md#debug-mode). Do not use in production! [OPTIONAL]` \
  -p 3000:3000 `# http gui` \
  -v ${BASEDIR:-/srv/lsio}/pairdrop/config:/config `# Configuration files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/pairdrop:latest
