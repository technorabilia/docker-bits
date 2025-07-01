# The [Unifi-network-application](https://ui.com/) software is a powerful,
# enterprise wireless software engine ideal for high-density client deployments
# requiring low latency and high uptime performance.

. ./.env
docker run -d \
  --name=unifi-network-application \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MONGO_USER=unifi `# Mongodb Username. Only evaluated on first run. **Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding)**.` \
  -e MONGO_PASS= `# Mongodb Password. Only evaluated on first run. **Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding)**.` \
  -e MONGO_HOST=unifi-db `# Mongodb Hostname. Only evaluated on first run.` \
  -e MONGO_PORT=27017 `# Mongodb Port. Only evaluated on first run.` \
  -e MONGO_DBNAME=unifi `# Mongodb Database Name (stats DB is automatically suffixed with `_stat`). Only evaluated on first run.` \
  -e MONGO_AUTHSOURCE=admin `# Mongodb [authSource](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.authSource). For Atlas set to `admin`. Only evaluated on first run.` \
  -e MEM_LIMIT=1024 `# Optionally change the Java memory limit (in Megabytes). Set to `default` to reset to default [OPTIONAL]` \
  -e MEM_STARTUP=1024 `# Optionally change the Java initial/minimum memory (in Megabytes). Set to `default` to reset to default [OPTIONAL]` \
  -e MONGO_TLS= `# Mongodb enable [TLS](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.tls). Only evaluated on first run. [OPTIONAL]` \
  -p 8443:8443 `# Unifi web admin port` \
  -p 3478:3478/udp `# Unifi STUN port` \
  -p 10001:10001/udp `# Required for AP discovery` \
  -p 8080:8080 `# Required for device communication` \
  -p 1900:1900/udp `# Required for `Make controller discoverable on L2 network` option [OPTIONAL]` \
  -p 8843:8843 `# Unifi guest portal HTTPS redirect port [OPTIONAL]` \
  -p 8880:8880 `# Unifi guest portal HTTP redirect port [OPTIONAL]` \
  -p 6789:6789 `# For mobile throughput test [OPTIONAL]` \
  -p 5514:5514/udp `# Remote syslog port [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/unifi-network-application/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/unifi-network-application:latest
