# [Ddclient](https://github.com/ddclient/ddclient) is a Perl client used to
# update dynamic DNS entries for accounts on Dynamic DNS Network Service
# Provider. It was originally written by Paul Burry and is now mostly by
# wimpunk. It has the capability to update more than just dyndns and it can
# fetch your WAN-ipaddress in a few different ways.

source ./.env
docker run -d \
  --name=ddclient \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -v ${BASEDIR:-/volume1/docker}/ddclient/config:/config `# Where ddclient should store its config files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/ddclient
