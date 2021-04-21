# [FIleZilla](https://filezilla-project.org/) Client is a fast and reliable
# cross-platform FTP, FTPS and SFTP client with lots of useful features and an
# intuitive graphical user interface.

source ./.env
docker run -d \
  --name=filezilla \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# FileZilla desktop gui.` \
  -v ${BASEDIR:-/volume1/docker}/filezilla/config:/config `# Users home directory in the container, stores local files and settings` \
  --restart unless-stopped \
  ghcr.io/linuxserver/filezilla
