# Snapdrop A local file sharing in your browser. Inspired by Apple's Airdrop.

source ./.env
docker run -d \
  --name=snapdrop \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# http gui` \
  -p 443:443 `# https gui` \
  -v ${BASEDIR:-/volume1/docker}/snapdrop/config:/config `# Persistent configs and logs.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/snapdrop
