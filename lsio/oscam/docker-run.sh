# [Oscam](https://git.streamboard.tv/common/oscam) is an Open Source Conditional
# Access Module software used for descrambling DVB transmissions using smart
# cards. It's both a server and a client.

. ./.env
docker run -d \
  --name=oscam \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8888:8888 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/oscam/config:/config `# Where oscam should store config files and logs.` \
  --device /dev/ttyUSB0:/dev/ttyUSB0 `# For passing through smart card readers.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/oscam
