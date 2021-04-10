# Requestrr is a chatbot used to simplify using services like Sonarr/Radarr/Ombi
# via the use of chat.

source ./.env
docker run -d \
  --name=requestrr \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 4545:4545 `# web gui` \
  -v ${BASEDIR:-/volume1/docker}/requestrr/config:/config `# Contains all relevant configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/requestrr
