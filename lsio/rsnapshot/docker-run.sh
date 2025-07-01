# [Rsnapshot](http://www.rsnapshot.org/) is a filesystem snapshot utility based
# on rsync. rsnapshot makes it easy to make periodic snapshots of local
# machines, and remote machines over ssh. The code makes extensive use of hard
# links whenever possible, to greatly reduce the disk space required.

. ./.env
docker run -d \
  --name=rsnapshot \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/rsnapshot/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/rsnapshot/.snapshots:/.snapshots `# Storage location for all snapshots. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/rsnapshot/data:/data `# Storage location for data to be backed up. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/rsnapshot:latest
