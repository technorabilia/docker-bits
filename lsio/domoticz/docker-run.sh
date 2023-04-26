# [Domoticz](https://www.domoticz.com) is a Home Automation System that lets you
# monitor and configure various devices like: Lights, Switches, various
# sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water and much
# more. Notifications/Alerts can be sent to any mobile device.

. ./.env
docker run -d \
  --name=domoticz \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e WEBROOT=domoticz `# optional` `# Sets webroot to domoticz for usage with subfolder reverse proxy. Not needed unless reverse proxying.` \
  -e DBASE=<path to database> `# optional` `# Sets path to database. Do not set unless you know what this does.` \
  -p 8080:8080 `# WebUI` \
  -p 6144:6144 `# Domoticz communication port.` \
  -p 1443:1443 `# Domoticz communication port.` \
  -v ${BASEDIR:-/volume1/docker}/domoticz/config:/config `# Where Domoticz stores config files and data.` \
  --device path to device:path to device `# For passing through USB devices.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/domoticz
