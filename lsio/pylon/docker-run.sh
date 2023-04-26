# [Pylon](https://github.com/pylonide/pylon) is a web based integrated
# development environment built with Node.js as a backend and with a
# supercharged JavaScript/HTML5 frontend, licensed under GPL version 3. This
# project originates from Cloud9 v2 project.

. ./.env
docker run -d \
  --name=pylon \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e GITURL=https://github.com/linuxserver/docker-pylon.git `# optional` `# Specify a git repo to checkout on first startup` \
  -e PYUSER=myuser `# optional` `# Specify a basic auth user.` \
  -e PYPASS=mypass `# optional` `# Specify a basic auth password.` \
  -p 3131:3131 `# The port for the Pylon web interface` \
  -v ${BASEDIR:-/volume1/docker}/pylon/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/pylon/code:/code `# optional` `# Optionally if you want the bind mount your own code and have changes survive container upgrades.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pylon
