# [Phpmyadmin](https://github.com/phpmyadmin/phpmyadmin/) is a free software
# tool written in PHP, intended to handle the administration of MySQL over the
# Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB.

source ./.env
docker run -d \
  --name=phpmyadmin \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e PMA_ARBITRARY=1 `# optional` `# Set to `1` to allow you to connect to any server. Setting to `0` will only allow you to connect to specified hosts (See Application Setup)` \
  -e PMA_ABSOLUTE_URI=https://phpmyadmin.example.com `# optional` `# Set the URL you will use to access the web frontend` \
  -p 80:80 `# Port for web frontend` \
  -v ${BASEDIR:-/volume1/docker}/phpmyadmin/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/phpmyadmin
