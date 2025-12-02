# [DOSBox Staging](https://www.dosbox-staging.org/) is a modern continuation of
# DOSBox a free and open-source emulator that enables the execution of MS-DOS
# software, especially video games.

. ./.env
docker run -d \
  --name=dosbox-staging \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# DOSBox Staging desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# DOSBox Staging desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/dosbox-staging/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/dosbox-staging:latest
