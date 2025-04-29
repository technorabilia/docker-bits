# [Home Assistant Core](https://www.home-assistant.io/) - Open source home
# automation that puts local control and privacy first. Powered by a worldwide
# community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi
# or a local server

. ./.env
docker run -d \
  --name=homeassistant \
  --net=host `# Shares host networking with container. Required for some devices to be discovered by Home Assistant.` \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8123:8123 `# optional` `# Application WebUI, only use this if you are not using host mode.` \
  -v ${BASEDIR:-/volume1/docker}/homeassistant/config:/config `# Home Assistant config storage path.` \
  --device /path/to/device:/path/to/device `# optional` `# For passing through USB, serial or gpio devices.` \
  --restart unless-stopped \
  lscr.io/linuxserver/homeassistant:latest
