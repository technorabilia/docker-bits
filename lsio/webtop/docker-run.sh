# [Webtop](https://github.com/linuxserver/docker-webtop) - Alpine, Ubuntu,
# Fedora, and Arch based containers containing full desktop environments in
# officially supported flavors accessible via any modern web browser.

. ./.env
docker run -d \
  --name=webtop \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Web Desktop GUI HTTP, must be proxied` \
  -p 3001:3001 `# Web Desktop GUI HTTPS` \
  -v ${BASEDIR:-/srv/lsio}/webtop/config:/config `# abc users home directory` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/webtop:latest
