# [Webgrabplus](https://www.webgrabplus.com) is a multi-site incremental xmltv
# epg grabber. It collects tv-program guide data from selected tvguide sites for
# your favourite channels.

. ./.env
docker run -d \
  --name=webgrabplus \
  --hostname=webgrabplus `# Set the hostname for the container for the license check.` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/webgrabplus/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/webgrabplus/data:/data `# Where webgrabplus should store it's data files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/webgrabplus
