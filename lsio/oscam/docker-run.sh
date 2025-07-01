# [Oscam](https://git.streamboard.tv/common/oscam) is an Open Source Conditional
# Access Module software used for descrambling DVB transmissions using smart
# cards. It's both a server and a client.

. ./.env
docker run -d \
  --name=oscam \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8888:8888 `# WebUI` \
  -v ${BASEDIR:-/srv/lsio}/oscam/config:/config `# Where oscam should store config files and logs.` \
  --device /dev/ttyUSB0:/dev/ttyUSB0 `# For passing through smart card readers.` \
  --restart unless-stopped \
  lscr.io/linuxserver/oscam:latest
