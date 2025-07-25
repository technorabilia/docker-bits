# [Audacity](https://www.audacityteam.org/) is an easy-to-use, multi-track audio
# editor and recorder. Developed by a group of volunteers as open source.

. ./.env
docker run -d \
  --name=audacity \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Audacity desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Audacity desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/audacity/config:/config `# Users home directory in the container, stores program settings and images` \
  --restart unless-stopped \
  lscr.io/linuxserver/audacity:latest
