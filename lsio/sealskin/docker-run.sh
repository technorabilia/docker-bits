# [Sealskin](https://github.com/selkies-project/sealskin/) is a self-hosted
# browser isolation and remote application streaming platform. It runs desktop
# applications in isolated containers on a server you control and streams them
# to any browser or phone. Clients include a browser extension, mobile apps, and
# a web app served by the server itself. Each turns links, files, downloads, and
# text selections into something you open remotely instead of locally, so
# nothing from the web runs on the device in front of you.

. ./.env
docker run -d \
  --name=sealskin \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e HOST_URL=IP or subdomain.domain.com `# On initial setup this will be used to fill in the default admin configuration file in the `/config` directory, if unset the string HOST_URL will need to be replaced. [OPTIONAL]` \
  -p 8443:8443 `# HTTPS Sessions and API communication port.` \
  -p 8000:8000 `# HTTP fallback API port, only needed by the Chrome extension with a self-signed certificate. [OPTIONAL]` \
  -p 8444:8444 `# Peer listener, only needed to join several servers into a cluster. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/sealskin/config:/config `# All configuration files and metadata for the application.` \
  -v ${BASEDIR:-/srv/lsio}/sealskin/storage:/storage `# All file storage for home directories and ephemeral mounts.` \
  -v /var/run/docker.sock:/var/run/docker.sock `# Docker socket, required to spin up application containers.` \
  --restart unless-stopped \
  lscr.io/linuxserver/sealskin:latest
