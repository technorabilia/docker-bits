# [Wireshark](https://www.wireshark.org/) is the world’s foremost and widely-
# used network protocol analyzer. It lets you see what’s happening on your
# network at a microscopic level and is the de facto (and often de jure)
# standard across many commercial and non-profit enterprises, government
# agencies, and educational institutions. Wireshark development thrives thanks
# to the volunteer contributions of networking experts around the globe and is
# the continuation of a project started by Gerald Combs in 1998.

. ./.env
docker run -d \
  --name=wireshark \
  --net=host `# Use Host Networking` \
  --cap-add=NET_ADMIN \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -p 3000:3000 `# WireShark desktop gui HTTPS, must be proxied. [OPTIONAL]` \
  -p 3001:3001 `# WireShark desktop gui HTTPS, only use this if you are not using host mode and sniffing Docker network traffic. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/wireshark/config:/config `# Users home directory in the container, stores program settings and potentially dump files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/wireshark:latest
