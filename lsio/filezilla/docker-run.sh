# [FIleZilla](https://filezilla-project.org/) Client is a fast and reliable
# cross-platform FTP, FTPS and SFTP client with lots of useful features and an
# intuitive graphical user interface.

. ./.env
docker run -d \
  --name=filezilla \
  -e PUID=${PUID:-1024} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-100} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# FileZilla desktop gui.` \
  -p 3001:3001 `# FileZilla desktop gui HTTPS.` \
  -v ${BASEDIR:-/volume1/docker}/filezilla/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  lscr.io/linuxserver/filezilla:latest
