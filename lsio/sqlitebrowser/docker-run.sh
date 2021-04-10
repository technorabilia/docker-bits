# [DB Browser for SQLite]({{ project_url }}) is a high quality, visual, open
# source tool to create, design, and edit database files compatible with SQLite.

source ./.env
docker run -d \
  --name=sqlitebrowser \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 3000:3000 `# Sqlitebrowser desktop gui, only use this if you are not using host mode and sniffing Docker network traffic.` \
  -v ${BASEDIR:-/volume1/docker}/sqlitebrowser/config:/config `# Users home directory in the container, stores program settings and potentially dump files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/sqlitebrowser
