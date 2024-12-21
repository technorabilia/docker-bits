# [Synclounge](https://github.com/samcm/synclounge) is a third party tool that
# allows you to watch Plex in sync with your friends/family, wherever you are.

. ./.env
docker run -d \
  --name=synclounge \
  -e AUTH_LIST=plexuser1,plexuser2,email1,machineid1 `# optional` `# If set, only the users defined here and the users of the plex servers defined here will be able to access the server. Use e-mails, plex usernames and/or plex server machine ids, comma separated, no spaces.` \
  -p 8088:8088 `# Web app and server port` \
  -v ${BASEDIR:-/volume1/docker}/synclounge/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/synclounge
