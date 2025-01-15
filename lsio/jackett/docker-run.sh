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
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e AUTO_UPDATE=true `# optional` `# Allow Jackett to update inside of the container.` \
  -e RUN_OPTS= `# optional` `# Optionally specify additional arguments to be passed.` \
  -p 9117:9117 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/jackett/config:/config `# Where Jackett should store its config file.` \
  -v ${BASEDIR:-/volume1/docker}/jackett/downloads:/downloads `# Path to torrent blackhole.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/jackett
