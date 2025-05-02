# [BOINC](https://boinc.berkeley.edu/) is a platform for high-throughput
# computing on a large scale (thousands or millions of computers). It can be
# used for volunteer computing (using consumer devices) or grid computing (using
# organizational resources). It supports virtualized, parallel, and GPU-based
# applications.

. ./.env
docker run -d \
  --name=boinc \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PASSWORD= `# Optionally set a password for the gui. [OPTIONAL]` \
  -p 8080:8080 `# Boinc desktop gui.` \
  -p 8181:8181 `# Boinc desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/boinc/config:/config `# Where BOINC should store its database and config.` \
  --device /dev/dri:/dev/dri `# Only needed if you want to use your Intel GPU (vaapi). [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/boinc:latest
