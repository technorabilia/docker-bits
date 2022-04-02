# [Htpcmanager](https://github.com/HTPC-Manager/HTPC-Manager) is a front end for
# many htpc related applications.

source ./.env
docker run -d \
  --name=htpcmanager \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 8085:8085 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/htpcmanager/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/htpcmanager
