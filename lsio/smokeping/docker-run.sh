# [Smokeping](https://oss.oetiker.ch/smokeping/) keeps track of your network
# latency. For a full example of what this application is capable of visit
# [UCDavis](http://smokeping.ucdavis.edu/cgi-bin/smokeping.fcgi).

. ./.env
docker run -d \
  --name=smokeping \
    --hostname={{ project_name }} `# optional` `# In a master-slave architecture, the hostname of the master node is displayed as its name in the web interface, while the hostname of the slave nodes represents their device aliases. These slave hostnames must match the aliases defined in the master's Slaves file.` \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MASTER_URL=http://<master-host-ip>:80/smokeping/ `# optional` `# Specify the master url to connect to. Used when in slave mode.` \
  -e SHARED_SECRET=password `# optional` `# Specify the master shared secret for this host. Used when in slave mode.` \
  -e CACHE_DIR=/tmp `# optional` `# Specify the cache directory for this host. Used when in slave mode.` \
  -p 80:80 `# Allows HTTP access to the internal webserver.` \
  -v ${BASEDIR:-/volume1/docker}/smokeping/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/smokeping/data:/data `# Storage location for db and application data (graphs etc)` \
  --restart unless-stopped \
  ghcr.io/linuxserver/smokeping
