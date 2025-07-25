# [Librespeed](https://github.com/librespeed/speedtest) is a very lightweight
# Speedtest implemented in Javascript, using XMLHttpRequest and Web Workers. No
# Flash, No Java, No Websocket, No Bullshit.

. ./.env
docker run -d \
  --name=librespeed \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PASSWORD=PASSWORD `# Set the password for the results database.` \
  -e CUSTOM_RESULTS=false `# (optional) set to `true` to enable custom results page in `/config/www/results/index.php`. [OPTIONAL]` \
  -e DB_TYPE=sqlite `# Defaults to `sqlite`, can also be set to `mysql` or `postgresql`. [OPTIONAL]` \
  -e DB_NAME=DB_NAME `# Database name. Required for mysql and pgsql. [OPTIONAL]` \
  -e DB_HOSTNAME=DB_HOSTNAME `# Database address. Required for mysql and pgsql. [OPTIONAL]` \
  -e DB_USERNAME=DB_USERNAME `# Database username. Required for mysql and pgsql. [OPTIONAL]` \
  -e DB_PASSWORD=DB_PASSWORD `# Database password. Required for mysql and pgsql. [OPTIONAL]` \
  -e DB_PORT=DB_PORT `# Database port. Required for mysql. [OPTIONAL]` \
  -e IPINFO_APIKEY=ACCESS_TOKEN `# Access token from ipinfo.io. Required for detailed IP information. [OPTIONAL]` \
  -p 80:80 `# web gui` \
  -v ${BASEDIR:-/srv/lsio}/librespeed/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/librespeed:latest
