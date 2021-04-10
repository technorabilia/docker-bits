# Pwndrop is a self-deployable file hosting service for sending out red teaming
# payloads or securely sharing your private files over HTTP and WebDAV.

source ./.env
docker run -d \
  --name=pwndrop \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -e SECRET_PATH=/pwndrop `# optional` `# Secret path for admin access. Defaults to `/pwndrop`. This parameter only takes effect during initial install; it can later be changed in the web gui.` \
  -p 8080:8080 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/pwndrop/config:/config `# Contains all relevant configuration and data.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/pwndrop
