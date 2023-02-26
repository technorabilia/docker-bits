# [Nntp2nntp](https://github.com/linuxserver/nntp2nntp) proxy allow you to use
# your NNTP Account from multiple systems, each with own user name and password.
# It fully supports SSL and you can also limit the access to proxy with SSL
# certificates. nntp2nntp proxy is very simple and pretty fast. ## Warning
# Whilst we know of no nntp2nntp security issues the [upstream
# code](https://github.com/linuxserver/nntp2nntp) for this project has received
# no changes since 06.08.15 and is likely abandoned permanently. For this reason
# we strongly recommend you do not make this application public facing and if
# you must do so other layers of security and SSL should be considered an
# absolute bare minimum requirement. We see this proxy being used primarily on a
# LAN so that all the users NNTP applications can share a common set of internal
# credentials allowing for central managment of the upstream account e.g change
# provider, server, thread limits for all applications with one global config
# change.

source ./.env
docker run -d \
  --name=nntp2nntp \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PUID=<yourUID> `# specify your UID` \
  -e PGID=<yourGID> `# specify your GID` \
  -p 1563:1563 `# will map the container's port 1563 to port 1563 on the host` \
  -v ${BASEDIR:-/volume1/docker}/nntp2nntp/config:/config `# this will store config on the docker host` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nntp2nntp
