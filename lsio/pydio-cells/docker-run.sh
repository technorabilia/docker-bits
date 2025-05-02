# [Pydio-cells](https://pydio.com/) is the nextgen file sharing platform for
# organizations. It is a full rewrite of the Pydio project using the Go language
# following a micro-service architecture.

. ./.env
docker run -d \
  --name=pydio-cells \
  --hostname={{ project_name }} `# Pydio Cells uses the hostname to verify local files. This setting is required and should not be changed after it has been set.` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e EXTERNALURL=yourdomain.url `# The external url you would like to use to access Pydio Cells (Can be https://domain.url or https://IP:PORT).` \
  -e SERVER_IP=0.0.0.0 `# Enter the LAN IP of the docker server. Required for local access by IP, added to self signed cert as SAN (not required if accessing only through reverse proxy). [OPTIONAL]` \
  -p 8080:8080 `# Http port` \
  -v ${BASEDIR:-/volume1/docker}/pydio-cells/config:/config `# All the config files reside here.` \
  --restart unless-stopped \
  lscr.io/linuxserver/pydio-cells:latest
