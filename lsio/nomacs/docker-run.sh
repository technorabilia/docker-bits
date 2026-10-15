# [Nomacs](https://github.com/nomacs/nomacs) is a free, open source image
# viewer, which supports multiple platforms. You can use it for viewing all
# common image formats including RAW and psd images.

. ./.env
docker run -d \
  --name=nomacs \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Nomacs desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Nomacs desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/nomacs/config:/config `# User's home directory in the container, stores program settings and images` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/nomacs:latest
