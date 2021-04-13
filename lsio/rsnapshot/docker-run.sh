# Rsnapshot is a filesystem snapshot utility based on rsync. rsnapshot makes it
# easy to make periodic snapshots of local machines, and remote machines over
# ssh. The code makes extensive use of hard links whenever possible, to greatly
# reduce the disk space required."

source ./.env
docker run -d \
  --name=rsnapshot \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/rsnapshot/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/rsnapshot/.snapshots:/.snapshots `# optional` `# Storage location for all snapshots.` \
  -v ${BASEDIR:-/volume1/docker}/rsnapshot/data:/data `# optional` `# Storage location for data to be backed up.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/rsnapshot
