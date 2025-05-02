# [Jackett](https://github.com/Jackett/Jackett) works as a proxy server: it
# translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into
# tracker-site-specific http queries, parses the html response, then sends
# results back to the requesting software. This allows for getting recent
# uploads (like RSS) and performing searches. Jackett is a single repository of
# maintained indexer scraping & translation logic - removing the burden from
# other apps.

. ./.env
docker run -d \
  --name=jackett \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e AUTO_UPDATE=true `# Allow Jackett to update inside of the container. [OPTIONAL]` \
  -e RUN_OPTS= `# Optionally specify additional arguments to be passed. [OPTIONAL]` \
  -p 9117:9117 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/jackett/config:/config `# Where Jackett should store its config file.` \
  -v ${BASEDIR:-/volume1/docker}/jackett/downloads:/downloads `# Path to torrent blackhole.` \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest
