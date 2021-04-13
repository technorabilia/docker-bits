# Projectsend is a self-hosted application that lets you upload files and assign
# them to specific clients that you create yourself. Secure, private and easy.
# No more depending on external services or e-mail to send those files.

source ./.env
docker run -d \
  --name=projectsend \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e MAX_UPLOAD=<5000> `# To set maximum upload size (in MB), default if unset is 5000.` \
  -p 80:80 `# WebUI` \
  -v ${BASEDIR:-/volume1/docker}/projectsend/config:/config `# Where to store projectsend config files.` \
  -v ${BASEDIR:-/volume1/docker}/projectsend/data:/data `# Where to store files to share.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/projectsend
