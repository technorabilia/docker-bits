# [Phpmyadmin](https://github.com/phpmyadmin/phpmyadmin/) is a free software
# tool written in PHP, intended to handle the administration of MySQL over the
# Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB.

. ./.env
docker run -d \
  --name=phpmyadmin \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PMA_ARBITRARY=1 `# Set to `1` to allow you to connect to any server. Setting to `0` will only allow you to connect to specified hosts (See Application Setup) [OPTIONAL]` \
  -e PMA_ABSOLUTE_URI=https://phpmyadmin.example.com `# Set the URL you will use to access the web frontend [OPTIONAL]` \
  -p 80:80 `# Port for web frontend` \
  -v ${BASEDIR:-/srv/lsio}/phpmyadmin/config:/config `# Persistent config files` \
  --restart unless-stopped \
  lscr.io/linuxserver/phpmyadmin:latest
