# [Kavita](https://github.com/Kareadita/Kavita) is a fast, feature rich, cross
# platform reading server. Built with a focus for being a full solution for all
# your reading needs. Setup your own server and share your reading collection
# with your friends and family!

. ./.env
docker run -d \
  --name=kavita \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 5000:5000 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/kavita/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/kavita/data:/data `# optional` `# Media library containing manga, comics and books.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/kavita
