# [Rdesktop](http://xrdp.org/) - Containers containing full desktop environments
# in many popular flavors for Alpine, Ubuntu, Arch, and Fedora accessible via
# RDP.

. ./.env
docker run -d \
  --name=rdesktop \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3389:3389 `# RDP access port` \
  -v ${BASEDIR:-/srv/lsio}/rdesktop/config:/config `# Configuration files.` \
  -v /var/run/docker.sock:/var/run/docker.sock `# Docker Socket on the system, if you want to use Docker in the container [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/rdesktop/config:/config `# abc users home directory [OPTIONAL]` \
  --device /dev/dri:/dev/dri `# Add this for GL support (Linux hosts only) [OPTIONAL]` \
  --shm-size="1gb" `# [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/rdesktop:latest
