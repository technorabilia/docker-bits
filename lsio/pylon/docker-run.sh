# [Pylon](https://github.com/pylonide/pylon) is a web based integrated
# development environment built with Node.js as a backend and with a
# supercharged JavaScript/HTML5 frontend, licensed under GPL version 3. This
# project originates from Cloud9 v2 project.

. ./.env
docker run -d \
  --name=pylon \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e GITURL=https://github.com/linuxserver/docker-pylon.git `# Specify a git repo to checkout on first startup [OPTIONAL]` \
  -e PYUSER=myuser `# Specify a basic auth user. [OPTIONAL]` \
  -e PYPASS=mypass `# Specify a basic auth password. [OPTIONAL]` \
  -p 3131:3131 `# The port for the Pylon web interface` \
  -v ${BASEDIR:-/srv/lsio}/pylon/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/srv/lsio}/pylon/code:/code `# Optionally if you want the bind mount your own code and have changes survive container upgrades. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/pylon:latest
