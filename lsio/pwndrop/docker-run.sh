# [Pwndrop](https://github.com/kgretzky/pwndrop) is a self-deployable file
# hosting service for sending out red teaming payloads or securely sharing your
# private files over HTTP and WebDAV.

. ./.env
docker run -d \
  --name=pwndrop \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e SECRET_PATH=/pwndrop `# Secret path for admin access. Defaults to `/pwndrop`. This parameter only takes effect during initial install; it can later be changed in the web gui. [OPTIONAL]` \
  -p 8080:8080 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/pwndrop/config:/config `# Contains all relevant configuration and data.` \
  --restart unless-stopped \
  lscr.io/linuxserver/pwndrop:latest
