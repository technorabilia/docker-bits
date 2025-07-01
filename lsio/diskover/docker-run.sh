# [Diskover](https://github.com/diskoverdata/diskover-community) is an open
# source file system indexer that uses Elasticsearch to index and manage data
# across heterogeneous storage systems.

. ./.env
docker run -d \
  --name=diskover \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e ES_HOST=elasticsearch `# ElasticSearch host (optional)` \
  -e ES_PORT=9200 `# ElasticSearch port (optional)` \
  -p 80:80 `# diskover Web UI` \
  -v ${BASEDIR:-/srv/lsio}/diskover/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/diskover/data:/data `# Default mount point to crawl` \
  --restart unless-stopped \
  lscr.io/linuxserver/diskover:latest
