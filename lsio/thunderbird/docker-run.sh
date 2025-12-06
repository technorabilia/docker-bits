# [Thunderbird](https://www.thunderbird.net/) is a free and open-source personal
# information manager primarily used as an e-mail client with a calendar and
# contactbook, as well as an RSS feed reader, chat client, and news client.

. ./.env
docker run -d \
  --name=thunderbird \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# Thunderbird desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# Thunderbird desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/thunderbird/config:/config `# Users home directory in the container, stores program settings and files.` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/thunderbird:latest
