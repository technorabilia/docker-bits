# [Duckdns](https://duckdns.org/) is a free service which will point a DNS (sub
# domains of duckdns.org) to an IP of your choice. The service is completely
# free, and doesn't require reactivation or forum posts to maintain its
# existence.

. ./.env
docker run -d \
  --name=duckdns \
  --net=host `# Use host networking for IPv6 detection [OPTIONAL]` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here. [OPTIONAL]` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here. [OPTIONAL]` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List). [OPTIONAL]` \
  -e SUBDOMAINS=subdomain1,subdomain2 `# multiple subdomains allowed, comma separated, no spaces, if your domain is user.duckdns.org you put user, not a sub-subdomain` \
  -e TOKEN=token `# DuckDNS token` \
  -e UPDATE_IP=ipv4 `# Set to `ipv6` or `ipv4` to update  **only** your public IPv4/6 address. Set to `both` to update IPv6 and IPv4 address. This variable makes use of a [third-party service](#notice-regarding-automatic-detection). Omitting this variable uses DuckDNS for detection and only supports IPv4. `both` and `ipv6` modes needs [host networking](#networking-net). [OPTIONAL]` \
  -e LOG_FILE=false `# Set to `true` to log to file (also need to map /config). [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/duckdns/config:/config `# Configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/duckdns/config:/config `# Persistent config files. Also set `LOG_FILE=true` to keep address history. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/duckdns:latest
