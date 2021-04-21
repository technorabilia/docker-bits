# [Rdesktop](http://xrdp.org/) - Ubuntu based containers containing full desktop
# environments in officially supported flavors accessible via RDP.

source ./.env
docker run -d \
  --name=rdesktop \
  --privileged `# optional` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3389:3389 `# RDP access port` \
  -v ${BASEDIR:-/volume1/docker}/rdesktop/var/run/docker.sock:/var/run/docker.sock `# optional` `# Docker Socket on the system, if you want to use Docker in the container` \
  -v ${BASEDIR:-/volume1/docker}/rdesktop/config:/config `# optional` `# abc users home directory` \
  --shm-size="1gb" `# optional` \
  --restart unless-stopped \
  ghcr.io/linuxserver/rdesktop
