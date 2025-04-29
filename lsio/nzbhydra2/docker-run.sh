# [Nzbhydra2](https://github.com/theotherp/nzbhydra2) is a meta search
# application for NZB indexers, the 'spiritual successor' to NZBmegasearcH, and
# an evolution of the original application
# [NZBHydra](https://github.com/theotherp/nzbhydra). It provides easy access to
# a number of raw and newznab based indexers.

. ./.env
docker run -d \
  --name=nzbhydra2 \
  -e PUID=${PUID:-1024} `# Run 'id [USER]]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5076:5076 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/nzbhydra2/config:/config `# Where nzbhydra2 should store config data.` \
  -v ${BASEDIR:-/volume1/docker}/nzbhydra2/downloads:/downloads `# optional` `# NZB download folder.` \
  --restart unless-stopped \
  lscr.io/linuxserver/nzbhydra2:latest
