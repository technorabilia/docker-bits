# [Double Commander](https://doublecmd.sourceforge.io/) is a free cross platform
# open source file manager with two panels side by side. It is inspired by Total
# Commander and features some new ideas.

source ./.env
docker run -d \
  --name=doublecommander \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Double Commander desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/doublecommander/config:/config `# Users home directory in the container, stores program settings.` \
  -v ${BASEDIR:-/volume1/docker}/doublecommander/data:/data `# Host data directories, mount as many as needed.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/doublecommander
