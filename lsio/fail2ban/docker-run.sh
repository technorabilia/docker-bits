# [Fail2ban](http://www.fail2ban.org/) is a daemon to ban hosts that cause
# multiple authentication errors.

. ./.env
docker run -d \
  --name=fail2ban \
  --net=host `# Shares host networking with container.` \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VERBOSITY=-vv `# optional` `# Set the container log verbosity. Valid options are -v, -vv, -vvv, -vvvv, or leaving the value blank or not setting the variable.` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/var/log:ro:/var/log:ro `# Host logs. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/airsonic:ro:/remotelogs/airsonic:ro `# optional` `# Optional path to airsonic log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/apache2:ro:/remotelogs/apache2:ro `# optional` `# Optional path to apache2 log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/authelia:ro:/remotelogs/authelia:ro `# optional` `# Optional path to authelia log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/emby:ro:/remotelogs/emby:ro `# optional` `# Optional path to emby log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/filebrowser:ro:/remotelogs/filebrowser:ro `# optional` `# Optional path to filebrowser log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/homeassistant:ro:/remotelogs/homeassistant:ro `# optional` `# Optional path to homeassistant log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/lighttpd:ro:/remotelogs/lighttpd:ro `# optional` `# Optional path to lighttpd log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nextcloud:ro:/remotelogs/nextcloud:ro `# optional` `# Optional path to nextcloud log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nginx:ro:/remotelogs/nginx:ro `# optional` `# Optional path to nginx log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nzbget:ro:/remotelogs/nzbget:ro `# optional` `# Optional path to nzbget log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/overseerr:ro:/remotelogs/overseerr:ro `# optional` `# Optional path to overseerr log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/prowlarr:ro:/remotelogs/prowlarr:ro `# optional` `# Optional path to prowlarr log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/radarr:ro:/remotelogs/radarr:ro `# optional` `# Optional path to radarr log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sabnzbd:ro:/remotelogs/sabnzbd:ro `# optional` `# Optional path to sabnzbd log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sonarr:ro:/remotelogs/sonarr:ro `# optional` `# Optional path to sonarr log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/unificontroller:ro:/remotelogs/unificontroller:ro `# optional` `# Optional path to unificontroller log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vaultwarden:ro:/remotelogs/vaultwarden:ro `# optional` `# Optional path to vaultwarden log folder. Mounted as Read Only.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/fail2ban
