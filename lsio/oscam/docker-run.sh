# Oscam is an Open Source Conditional Access Module software used for
# descrambling DVB transmissions using smart cards. It's both a server and a
# client.

source ./.env
docker run -d \
  --name=oscam \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8888:8888 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/oscam/config:/config `# Where oscam should store config files and logs.` \
  --device /dev/ttyUSB0:/dev/ttyUSB0 `# For passing through smart card readers.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/oscam
