# [Librespeed](https://github.com/librespeed/speedtest) is a very lightweight
# Speedtest implemented in Javascript, using XMLHttpRequest and Web Workers. No
# Flash, No Java, No Websocket, No Bullshit.

. ./.env
docker run -d \
  --name=librespeed \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PASSWORD=PASSWORD `# Set the password for the results database.` \
  -e CUSTOM_RESULTS=false `# optional` `# (optional) set to `true` to enable custom results page in `/config/www/results/index.php`.` \
  -e DB_TYPE=sqlite `# optional` `# Defaults to `sqlite`, can also be set to `mysql` or `postgresql`.` \
  -e DB_NAME=DB_NAME `# optional` `# Database name. Required for mysql and pgsql.` \
  -e DB_HOSTNAME=DB_HOSTNAME `# optional` `# Database address. Required for mysql and pgsql.` \
  -e DB_USERNAME=DB_USERNAME `# optional` `# Database username. Required for mysql and pgsql.` \
  -e DB_PASSWORD=DB_PASSWORD `# optional` `# Database password. Required for mysql and pgsql.` \
  -e DB_PORT=DB_PORT `# optional` `# Database port. Required for mysql.` \
  -e IPINFO_APIKEY=ACCESS_TOKEN `# optional` `# Access token from ipinfo.io. Required for detailed IP information.` \
  -p 80:80 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/librespeed/config:/config `# Persistent config files` \
  --restart unless-stopped \
  ghcr.io/linuxserver/librespeed
