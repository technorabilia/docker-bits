# [BOINC](https://boinc.berkeley.edu/) is a platform for high-throughput
# computing on a large scale (thousands or millions of computers). It can be
# used for volunteer computing (using consumer devices) or grid computing (using
# organizational resources). It supports virtualized, parallel, and GPU-based
# applications.

. ./.env
docker run -d \
  --name=boinc \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PASSWORD= `# optional` `# Optionally set a password for the gui.` \
  -p 8080:8080 `# Boinc desktop gui.` \
  -p 8181:8181 `# Boinc desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/boinc/config:/config `# Where BOINC should store its database and config.` \
  --device /dev/dri:/dev/dri `# optional` `# Only needed if you want to use your Intel GPU (vaapi).` \
  --restart unless-stopped \
  ghcr.io/linuxserver/boinc
