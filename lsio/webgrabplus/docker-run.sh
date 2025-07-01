# [Webgrabplus](https://www.webgrabplus.com) is a multi-site incremental xmltv
# epg grabber. It collects tv-program guide data from selected tvguide sites for
# your favourite channels.

. ./.env
docker run -d \
  --name=webgrabplus \
  --hostname=webgrabplus `# Set the hostname for the container for the license check.` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/webgrabplus/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/webgrabplus/data:/data `# Where webgrabplus should store it's data files.` \
  --restart unless-stopped \
  lscr.io/linuxserver/webgrabplus:latest
