# Cloud9 Cloud9 is a complete web based IDE with terminal access. This container
# is for running their core SDK locally and developing plugins.

source ./.env
docker run -d \
  --name=cloud9 \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e GITURL=https://github.com/linuxserver/docker-cloud9.git `# optional` `# Specify a git repo to checkout on first startup` \
  -e USERNAME= `# optional` `# Optionally specify a username for http auth` \
  -e PASSWORD= `# optional` `# Optionally specify a password for http auth (if USERNAME and PASSWORD are not set, there will be no http auth)` \
  -p 8000:8000 `# The port for the Cloud9 web interface` \
  -v ${BASEDIR:-/volume1/docker}/cloud9/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/cloud9/code:/code `# optional` `# Optionally if you want to mount up a local folder of code instead of checking out` \
  -v ${BASEDIR:-/volume1/docker}/cloud9/var/run/docker.sock:/var/run/docker.sock `# optional` `# Needed if you plan to use Docker or compose commands` \
  --restart unless-stopped \
  ghcr.io/linuxserver/cloud9
