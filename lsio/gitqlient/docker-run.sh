# [GitQlient](https://github.com/francescmm/GitQlient) is a multi-platform Git
# client originally forked from QGit. Nowadays it goes beyond of just a fork and
# adds a lot of new functionality.

. ./.env
docker run -d \
  --name=gitqlient \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# HTTP GitQlient desktop gui, must be proxied.` \
  -p 3001:3001 `# HTTPS GitQlient desktop gui.` \
  -v ${BASEDIR:-/srv/lsio}/gitqlient/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/gitqlient:latest
