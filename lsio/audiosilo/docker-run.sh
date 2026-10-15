# [AudioSilo](https://audiosilo.app) is a self-hosted audiobook server. Point it
# at your audiobook folders and listen from the built-in web player or the
# AudioSilo apps for iOS and Android, with listening progress synced across
# devices.

. ./.env
docker run -d \
  --name=audiosilo \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# Web player, admin console and the API the apps connect to.` \
  -v ${BASEDIR:-/srv/lsio}/audiosilo/config:/config `# Persistent config files, database, backups and TLS certificates.` \
  -v ${BASEDIR:-/srv/lsio}/audiosilo/audiobooks:ro:/audiobooks:ro `# Audiobooks location, read-only (the server never writes to your books). Add it as a library in the admin console.` \
  --restart unless-stopped \
  lscr.io/linuxserver/audiosilo:latest
