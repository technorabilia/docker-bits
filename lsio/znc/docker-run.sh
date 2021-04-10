# Znc is an IRC network bouncer or BNC. It can detach the client from the actual
# IRC server, and also from selected channels. Multiple clients from different
# locations can connect to a single ZNC account simultaneously and therefore
# appear under the same nickname on IRC.

source ./.env
docker run -d \
  --name=znc \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 6501:6501 `# Port ZNC listens on.` \
  -v ${BASEDIR:-/volume1/docker}/znc/config:/config `# Where local ZNC data is stored.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/znc
