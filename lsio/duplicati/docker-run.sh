# [Duplicati](https://www.duplicati.com/) works with standard protocols like
# FTP, SSH, WebDAV as well as popular services like Microsoft OneDrive, Amazon
# Cloud Drive & S3, Google Drive, box.com, Mega, hubiC and many others.

source ./.env
docker run -d \
  --name=duplicati \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CLI_ARGS= `# optional` `# Optionally specify any [CLI variables](https://duplicati.readthedocs.io/en/latest/07-other-command-line-utilities/) you want to launch the app with` \
  -p 8200:8200 `# http gui` \
  -v ${BASEDIR:-/volume1/docker}/duplicati/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/duplicati/backups:/backups `# Path to store local backups.` \
  -v ${BASEDIR:-/volume1/docker}/duplicati/source:/source `# Path to source for files to backup.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/duplicati
