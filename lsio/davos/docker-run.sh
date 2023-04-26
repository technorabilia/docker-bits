# [Davos](https://github.com/linuxserver/davos) is an FTP automation tool that
# periodically scans given host locations for new files. It can be configured
# for various purposes, including listening for specific files to appear in the
# host location, ready for it to download and then move, if required. It also
# supports completion notifications as well as downstream API calls, to further
# the workflow.

. ./.env
docker run -d \
  --name=davos \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# This is the default port that davos runs under` \
  -v ${BASEDIR:-/volume1/docker}/davos/config:/config `# davos's config location. This is where it stores its database file and logs.` \
  -v ${BASEDIR:-/volume1/docker}/davos/download:/download `# davos's file download location` \
  --restart unless-stopped \
  ghcr.io/linuxserver/davos
