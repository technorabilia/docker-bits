# [Duckdns](https://duckdns.org/) is a free service which will point a DNS (sub
# domains of duckdns.org) to an IP of your choice. The service is completely
# free, and doesn't require reactivation or forum posts to maintain its
# existence.

source ./.env
docker run -d \
  --name=duckdns \
  -e PUID=${PUID:-1024} `# optional` `# for UserID` \
  -e PGID=${PGID:-100} `# optional` `# for GroupID` \
  -e TZ=Etc/UTC `# optional` `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SUBDOMAINS=subdomain1,subdomain2 `# multiple subdomains allowed, comma separated, no spaces` \
  -e TOKEN=token `# DuckDNS token` \
  -e LOG_FILE=false `# optional` `# Set to `true` to log to file (also need to map /config).` \
  -v ${BASEDIR:-/volume1/docker}/duckdns/config:/config `# optional` `# Used in conjunction with logging to file.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/duckdns
