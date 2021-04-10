# Smokeping keeps track of your network latency. For a full example of what this
# application is capable of visit [UCDavis](http://smokeping.ucdavis.edu/cgi-
# bin/smokeping.fcgi).

source ./.env
docker run -d \
  --name=smokeping \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Allows HTTP access to the internal webserver.` \
  -v ${BASEDIR:-/volume1/docker}/smokeping/config:/config `# Configure the `Targets` file here` \
  -v ${BASEDIR:-/volume1/docker}/smokeping/data:/data `# Storage location for db and application data (graphs etc)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/smokeping
