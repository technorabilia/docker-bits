# The [Unifi-network-application](https://ui.com/) software is a powerful,
# enterprise wireless software engine ideal for high-density client deployments
# requiring low latency and high uptime performance.

. ./.env
docker run -d \
  --name=unifi-network-application \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MONGO_USER=unifi `# Mongodb Username. Only evaluated on first run. **Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding)**.` \
  -e MONGO_PASS= `# Mongodb Password. Only evaluated on first run. **Special characters must be [url encoded](https://en.wikipedia.org/wiki/Percent-encoding)**.` \
  -e MONGO_HOST=unifi-db `# Mongodb Hostname. Only evaluated on first run.` \
  -e MONGO_PORT=27017 `# Mongodb Port. Only evaluated on first run.` \
  -e MONGO_DBNAME=unifi `# Mongodb Database Name (stats DB is automatically suffixed with `_stat`). Only evaluated on first run.` \
  -e MONGO_AUTHSOURCE=admin `# Mongodb [authSource](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.authSource). For Atlas set to `admin`. Only evaluated on first run.` \
  -e MEM_LIMIT=1024 `# optional` `# Optionally change the Java memory limit (in Megabytes). Set to `default` to reset to default` \
  -e MEM_STARTUP=1024 `# optional` `# Optionally change the Java initial/minimum memory (in Megabytes). Set to `default` to reset to default` \
  -e MONGO_TLS= `# optional` `# Mongodb enable [TLS](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.tls). Only evaluated on first run.` \
  -p 8443:8443 `# Unifi web admin port` \
  -p 3478:3478/udp `# Unifi STUN port` \
  -p 10001:10001/udp `# Required for AP discovery` \
  -p 8080:8080 `# Required for device communication` \
  -p 1900:1900/udp `# optional` `# Required for `Make controller discoverable on L2 network` option` \
  -p 8843:8843 `# optional` `# Unifi guest portal HTTPS redirect port` \
  -p 8880:8880 `# optional` `# Unifi guest portal HTTP redirect port` \
  -p 6789:6789 `# optional` `# For mobile throughput test` \
  -p 5514:5514/udp `# optional` `# Remote syslog port` \
  -v ${BASEDIR:-/volume1/docker}/unifi-network-application/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/unifi-network-application
