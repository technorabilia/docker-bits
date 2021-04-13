# [{{ project_name }}]({{ project_url }}) is a file system crawler and disk
# space usage software that uses Elasticsearch to index and manage data across
# heterogeneous storage systems.

source ./.env
docker run -d \
  --name=diskover \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e REDIS_HOST=redis `# Redis host (optional)` \
  -e REDIS_PORT=6379 `# Redis port (optional)` \
  -e ES_HOST=elasticsearch `# ElasticSearch host (optional)` \
  -e ES_PORT=9200 `# ElasticSearch port (optional)` \
  -e ES_USER=elastic `# ElasticSearch username (optional)` \
  -e ES_PASS=changeme `# ElasticSearch password (optional)` \
  -e INDEX_NAME=diskover- `# Index name prefix (optional)` \
  -e DISKOVER_OPTS= `# Optional arguments to pass to the diskover crawler (optional)` \
  -e WORKER_OPTS= `# Optional argumens to pass to the diskover bots launcher (optional)` \
  -e RUN_ON_START=true `# Initiate a crawl every time the container is started (optional)` \
  -e USE_CRON=true `# Run a crawl on as a cron job (optional)` \
  -p 80:80 `# diskover Web UI` \
  -p 9181:9181 `# rq-dashboard web UI` \
  -p 9999:9999 `# diskover socket server` \
  -v ${BASEDIR:-/volume1/docker}/diskover/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/diskover/data:/data `# Default mount point to crawl` \
  --restart unless-stopped \
  ghcr.io/linuxserver/diskover
