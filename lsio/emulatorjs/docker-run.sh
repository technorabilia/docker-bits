# [Emulatorjs](https://github.com/linuxserver/emulatorjs) - A fork of NeptunJS
# used to run multiple web based emulators for retro games. This projects adds a
# management layer for adding roms and artwork to make it self hosted.

source ./.env
docker run -d \
  --name=emulatorjs \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBFOLDER=/ `# optional` `# Specify a subfolder for reverse proxies IE '/FOLDER/'` \
  -p 3000:3000 `# Rom/artwork management interface, used to generate/manage config files and download artwork` \
  -p 80:80 `# Emulation frontend containing static web files used to browse and launch games` \
  -p 4001:4001 `# optional` `# IPFS peering port, if you want to participate in the P2P network to distribute frontend artwork please forward this to the Internet` \
  -v ${BASEDIR:-/volume1/docker}/emulatorjs/data:/data `# Path to store roms/artwork` \
  --restart unless-stopped \
  ghcr.io/linuxserver/emulatorjs
