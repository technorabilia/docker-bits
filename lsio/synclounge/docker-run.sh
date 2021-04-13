# Synclounge is a third party tool that allows you to watch Plex in sync with
# your friends/family, wherever you are.

source ./.env
docker run -d \
  --name=synclounge \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e AUTH_LIST=plexuser1,plexuser2,email1,machineid1 `# optional` `# If set, only the users defined here and the users of the plex servers defined here will be able to access the server. Use e-mails, plex usernames and/or plex server machine ids, comma separated, no spaces.` \
  -e AUTOJOIN_ENABLED=false `# optional` `# DEPRECATED - (Still works but will be removed in the future in favor of the built-in var `autojoin__room`) - Set to `true` to let users autojoin the server and a room (specified by the `AUTOJOIN_ROOM` var).` \
  -e AUTOJOIN_ROOM=roomname `# optional` `# DEPRECATED - (Still works but will be removed in the future in favor of the built-in var `autojoin__room`) - Set the room name for auto joining (requires `AUTOJOIN_ENABLED` set to `true`).` \
  -p 8088:8088 `# Web app and server port` \
  --restart unless-stopped \
  ghcr.io/linuxserver/synclounge
