# Librespeed is a very lightweight Speedtest implemented in Javascript, using
# XMLHttpRequest and Web Workers. No Flash, No Java, No Websocket, No Bullshit.

source ./.env
docker run -d \
  --name=librespeed \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e PASSWORD=PASSWORD `# Set the password for the results database.` \
  -e CUSTOM_RESULTS=false `# optional` `# (optional) set to `true` to enable custom results page in `/config/www/results/index.php`.` \
  -e DB_TYPE=sqlite `# optional` `# Defaults to `sqlite`, can also be set to `mysql` or `postgresql`.` \
  -e DB_NAME=DB_NAME `# optional` `# Database name. Required for mysql and pgsql.` \
  -e DB_HOSTNAME=DB_HOSTNAME `# optional` `# Database address. Required for mysql and pgsql.` \
  -e DB_USERNAME=DB_USERNAME `# optional` `# Database username. Required for mysql and pgsql.` \
  -e DB_PASSWORD=DB_PASSWORD `# optional` `# Database password. Required for mysql and pgsql.` \
  -e DB_PORT=DB_PORT `# optional` `# Database port. Required for mysql.` \
  -p 80:80 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/librespeed/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/librespeed
