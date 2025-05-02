# [Calibre](https://calibre-ebook.com/) is a powerful and easy to use e-book
# manager. Users say it's outstanding and a must-have. It'll allow you to do
# nearly everything and it takes things a step beyond normal e-book software.
# It's also completely free and open source and great for both casual users and
# computer experts.

. ./.env
docker run -d \
  --name=calibre \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PASSWORD= `# Optionally set a password for the gui. [OPTIONAL]` \
  -e CLI_ARGS= `# Optionally pass cli start arguments to calibre. [OPTIONAL]` \
  -p 8080:8080 `# Calibre desktop gui.` \
  -p 8181:8181 `# Calibre desktop gui HTTPS.` \
  -p 8081:8081 `# Calibre webserver gui.` \
  -v ${BASEDIR:-/volume1/docker}/calibre/config:/config `# Where calibre should store its database and library.` \
  --restart unless-stopped \
  lscr.io/linuxserver/calibre:latest
