# [Nzbhydra2](https://github.com/theotherp/nzbhydra2) is a meta search
# application for NZB indexers, the spiritual successor to NZBmegasearcH, and an
# evolution of the original application
# [NZBHydra](https://github.com/theotherp/nzbhydra). It provides easy access to
# a number of raw and newznab based indexers.

. ./.env
docker run -d \
  --name=nzbhydra2 \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5076:5076 `# WebUI` \
  -v ${BASEDIR:-/srv/lsio}/nzbhydra2/config:/config `# Where nzbhydra2 should store config data.` \
  -v ${BASEDIR:-/srv/lsio}/nzbhydra2/downloads:/downloads `# NZB download folder. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/nzbhydra2:latest
