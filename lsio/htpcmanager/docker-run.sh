# [Htpcmanager](https://github.com/HTPC-Manager/HTPC-Manager) is a front end for
# many htpc related applications.

. ./.env
docker run -d \
  --name=htpcmanager \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 8085:8085 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/htpcmanager/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/htpcmanager:latest
