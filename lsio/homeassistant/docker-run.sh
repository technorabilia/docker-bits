# [Homeassistant](https://www.home-assistant.io/) is open source home automation
# that puts local control and privacy first. Powered by a worldwide community of
# tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local
# server.

source ./.env
docker run -d \
  --name=homeassistant \
  --net=host `# Shares host networking with container. Required for some devices to be discovered by Home Assistant.` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8123:8123 `# optional` `# Application WebUI, only use this if you are not using host mode.` \
  -v ${BASEDIR:-/volume1/docker}/homeassistant/config:/config `# Home Assistant config storage path.` \
  --device /path/to/device:/path/to/device `# For passing through USB, serial or gpio devices.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/homeassistant
