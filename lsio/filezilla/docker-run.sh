# [FIleZilla](https://filezilla-project.org/) Client is a fast and reliable
# cross-platform FTP, FTPS and SFTP client with lots of useful features and an
# intuitive graphical user interface.

. ./.env
docker run -d \
  --name=filezilla \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# FileZilla desktop gui HTTP, must be proxied.` \
  -p 3001:3001 `# FileZilla desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/filezilla/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/filezilla:latest
