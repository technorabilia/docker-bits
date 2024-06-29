# [Ddclient](https://github.com/ddclient/ddclient) is a Perl client used to
# update dynamic DNS entries for accounts on Dynamic DNS Network Service
# Provider. It was originally written by Paul Burry and is now mostly by
# wimpunk. It has the capability to update more than just dyndns and it can
# fetch your WAN-ipaddress in a few different ways.

. ./.env
docker run -d \
  --name=ddclient \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/ddclient/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ddclient
