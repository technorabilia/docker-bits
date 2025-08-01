# [Smokeping](https://oss.oetiker.ch/smokeping/) keeps track of your network
# latency. For a full example of what this application is capable of visit
# [UCDavis](http://smokeping.ucdavis.edu/cgi-bin/smokeping.fcgi).

. ./.env
docker run -d \
  --name=smokeping \
    --hostname={{ project_name }} `# In a master-slave architecture, the hostname of the master node is displayed as its name in the web interface, while the hostname of the slave nodes represents their device aliases. These slave hostnames must match the aliases defined in the master's Slaves file. [OPTIONAL]` \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e MASTER_URL=http://<master-host-ip>:80/smokeping/ `# Specify the master url to connect to. Used when in slave mode. [OPTIONAL]` \
  -e SHARED_SECRET=password `# Specify the master shared secret for this host. Used when in slave mode. [OPTIONAL]` \
  -e CACHE_DIR=/tmp `# Specify the cache directory for this host. Used when in slave mode. [OPTIONAL]` \
  -p 80:80 `# Allows HTTP access to the internal webserver.` \
  -v ${BASEDIR:-/srv/lsio}/smokeping/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/smokeping/data:/data `# Storage location for db and application data (graphs etc)` \
  --restart unless-stopped \
  lscr.io/linuxserver/smokeping:latest
