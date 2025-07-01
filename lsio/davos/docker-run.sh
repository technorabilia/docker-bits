# [Davos](https://github.com/linuxserver/davos) is an FTP automation tool that
# periodically scans given host locations for new files. It can be configured
# for various purposes, including listening for specific files to appear in the
# host location, ready for it to download and then move, if required. It also
# supports completion notifications as well as downstream API calls, to further
# the workflow.

. ./.env
docker run -d \
  --name=davos \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8080:8080 `# This is the default port that davos runs under` \
  -v ${BASEDIR:-/srv/lsio}/davos/config:/config `# davos's config location. This is where it stores its database file and logs.` \
  -v ${BASEDIR:-/srv/lsio}/davos/download:/download `# davos's file download location` \
  --restart unless-stopped \
  lscr.io/linuxserver/davos:latest
