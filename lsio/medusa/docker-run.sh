# [Medusa](https://pymedusa.com/) is an automatic Video Library Manager for TV
# Shows. It watches for new episodes of your favorite shows, and when they are
# posted it does its magic.

. ./.env
docker run -d \
  --name=medusa \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8081:8081 `# The port for the Medusa webui` \
  -v ${BASEDIR:-/volume1/docker}/medusa/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/medusa/downloads:/downloads `# Download location` \
  -v ${BASEDIR:-/volume1/docker}/medusa/tv:/tv `# TV Shows location` \
  --restart unless-stopped \
  lscr.io/linuxserver/medusa:latest
