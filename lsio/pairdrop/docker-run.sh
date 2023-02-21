# [PairDrop](https://github.com/schlagmichdoch/PairDrop) is a sublime
# alternative to AirDrop that works on all platforms. Send images, documents or
# text via peer to peer connection to devices in the same local network/Wi-Fi or
# to paired devices.

source ./.env
docker run -d \
  --name=pairdrop \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=Etc/UTC `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e RATE_LIMIT=false `# optional` `# Set to `true` to limit clients to 100 requests per 5 min` \
  -e WS_FALLBACK=false `# optional` `# Set to `true` to enable websocket fallback if the peer to peer WebRTC connection is not available to the client (see App Setup notes).` \
  -p 3000:3000 `# http gui` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pairdrop
