# [Sealskin](https://github.com/selkies-project/sealskin/) is a self-hosted,
# client-server platform that enables users to run powerful, containerized
# desktop applications streamed directly to a web browser. It uses a browser
# extension to intercept user actions—such as clicking a link or downloading a
# file and redirects them to a secure, isolated application environment running
# on a remote server.

. ./.env
docker run -d \
  --name=sealskin \
  --net=bridge `# Use default bridge network` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8000:8000 `# API communication port.` \
  -p 8443:8443 `# App session port.` \
  -v ${BASEDIR:-/srv/lsio}/sealskin/config:/config `# All configuration files and metadata for the application.` \
  -v ${BASEDIR:-/srv/lsio}/sealskin/storage:/storage `# All file storage for home directories and ephemeral mounts.` \
  -v /var/run/docker.sock:/var/run/docker.sock `# Docker socket, required to spin up application containers.` \
  --restart unless-stopped \
  lscr.io/linuxserver/sealskin:latest
