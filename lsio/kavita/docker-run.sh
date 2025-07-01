# [Kavita](https://github.com/Kareadita/Kavita) is a fast, feature rich, cross
# platform reading server. Built with a focus for being a full solution for all
# your reading needs. Setup your own server and share your reading collection
# with your friends and family!

. ./.env
docker run -d \
  --name=kavita \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5000:5000 `# web gui` \
  -v ${BASEDIR:-/srv/lsio}/kavita/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/srv/lsio}/kavita/data:/data `# Media library containing manga, comics and books. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/kavita:latest
