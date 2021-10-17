# [Diskover](https://github.com/diskoverdata/diskover-community) is an open
# source file system indexer that uses Elasticsearch to index and manage data
# across heterogeneous storage systems.

source ./.env
docker run -d \
  --name=diskover \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e ES_HOST=elasticsearch `# ElasticSearch host (optional)` \
  -e ES_PORT=9200 `# ElasticSearch port (optional)` \
  -e ES_USER=elastic `# ElasticSearch username (optional)` \
  -e ES_PASS=changeme `# ElasticSearch password (optional)` \
  -p 80:80 `# diskover Web UI` \
  -v ${BASEDIR:-/volume1/docker}/diskover/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/diskover/data:/data `# Default mount point to crawl` \
  --restart unless-stopped \
  ghcr.io/linuxserver/diskover
