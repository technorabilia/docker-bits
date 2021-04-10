# Quassel-web is a web client for Quassel.  Note that a Quassel-Core instance is
# required, we have a container available
# [here.](https://hub.docker.com/r/linuxserver/quassel-core/)

source ./.env
docker run -d \
  --name=quassel-web \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e QUASSEL_CORE=192.168.1.10 `# specify the URL or IP address of your Quassel Core instance` \
  -e QUASSEL_PORT=4242 `# specify the port of your Quassel Core instance` \
  -e URL_BASE=/quassel `# optional` `# Specify a url-base in reverse proxy setups ie. `/quassel`` \
  -p 64080:64080 `# will map the container's port 64080 to port 64080 on the host` \
  -v ${BASEDIR:-/volume1/docker}/quassel-web/config:/config `# this will store config on the docker host` \
  --restart unless-stopped \
  ghcr.io/linuxserver/quassel-web
