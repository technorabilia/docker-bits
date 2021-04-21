# [Domoticz](https://www.domoticz.com) is a Home Automation System that lets you
# monitor and configure various devices like: Lights, Switches, various
# sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water and much
# more. Notifications/Alerts can be sent to any mobile device.

source ./.env
docker run -d \
  --name=domoticz \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e WEBROOT=domoticz `# optional` `# Sets webroot to domoticz for usage with subfolder reverse proxy. Not needed unless reverse proxying.` \
  -p 8080:8080 `# WebUI` \
  -p 6144:6144 `# Domoticz communication port.` \
  -p 1443:1443 `# Domoticz communication port.` \
  -v ${BASEDIR:-/volume1/docker}/domoticz/config:/config `# Where Domoticz stores config files and data.` \
  --device <path to device>:<path to device> `# For passing through USB devices.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/domoticz
