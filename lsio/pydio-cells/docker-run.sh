# [Pydio-cells](https://pydio.com/) is the nextgen file sharing platform for
# organizations. It is a full rewrite of the Pydio project using the Go language
# following a micro-service architecture.

source ./.env
docker run -d \
  --name=pydio-cells \
  --hostname={{ project_name }} `# Pydio Cells uses the hostname to verify local files. This setting is required and should not be changed after it has been set.` \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e EXTERNALURL=yourdomain.url `# The external url you would like to use to access Pydio Cells (Can be https://domain.url or https://IP:PORT).` \
  -e SERVER_IP=0.0.0.0 `# optional` `# Enter the LAN IP of the docker server. Required for local access by IP, added to self signed cert as SAN (not required if accessing only through reverse proxy).` \
  -p 8080:8080 `# Http port` \
  -p 33060:33060 `# optional` `# gRPC port (required for CellsSync).` \
  -v ${BASEDIR:-/volume1/docker}/pydio-cells/config:/config `# All the config files reside here.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pydio-cells
