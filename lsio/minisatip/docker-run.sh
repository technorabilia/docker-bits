# [Minisatip](https://github.com/catalinii/minisatip) is a multi-threaded satip
# server version 1.2 that runs under Linux and it was tested with DVB-S, DVB-S2,
# DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards.

source ./.env
docker run -d \
  --name=minisatip \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e RUN_OPTS=<parameter> `# Specify specific run params for minisatip` \
  -p 8875:8875 `# Status Page WebUI` \
  -p 554:554 `# RTSP Port` \
  -p 1900:1900/udp `# App Discovery` \
  -v ${BASEDIR:-/volume1/docker}/minisatip/config:/config `# Configuration files and minisatip data` \
  --device /dev/dvb:/dev/dvb `# For passing through Tv-cards` \
  --restart unless-stopped \
  ghcr.io/linuxserver/minisatip
