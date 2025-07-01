# [Fail2ban](http://www.fail2ban.org/) is a daemon to ban hosts that cause
# multiple authentication errors.

. ./.env
docker run -d \
  --name=fail2ban \
  --net=host `# Shares host networking with container.` \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e VERBOSITY=-vv `# Set the container log verbosity. Valid options are -v, -vv, -vvv, -vvvv, or leaving the value blank or not setting the variable. [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/config:/config `# Persistent config files` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/var/log:ro:/var/log:ro `# Host logs. Mounted as Read Only.` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/airsonic:ro:/remotelogs/airsonic:ro `# Optional path to airsonic log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/apache2:ro:/remotelogs/apache2:ro `# Optional path to apache2 log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/authelia:ro:/remotelogs/authelia:ro `# Optional path to authelia log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/emby:ro:/remotelogs/emby:ro `# Optional path to emby log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/filebrowser:ro:/remotelogs/filebrowser:ro `# Optional path to filebrowser log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/homeassistant:ro:/remotelogs/homeassistant:ro `# Optional path to homeassistant log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/lighttpd:ro:/remotelogs/lighttpd:ro `# Optional path to lighttpd log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/nextcloud:ro:/remotelogs/nextcloud:ro `# Optional path to nextcloud log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/nginx:ro:/remotelogs/nginx:ro `# Optional path to nginx log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/nzbget:ro:/remotelogs/nzbget:ro `# Optional path to nzbget log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/overseerr:ro:/remotelogs/overseerr:ro `# Optional path to overseerr log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/prowlarr:ro:/remotelogs/prowlarr:ro `# Optional path to prowlarr log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/radarr:ro:/remotelogs/radarr:ro `# Optional path to radarr log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/sabnzbd:ro:/remotelogs/sabnzbd:ro `# Optional path to sabnzbd log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/sonarr:ro:/remotelogs/sonarr:ro `# Optional path to sonarr log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/unificontroller:ro:/remotelogs/unificontroller:ro `# Optional path to unificontroller log folder. Mounted as Read Only. [OPTIONAL]` \
  -v ${BASEDIR:-/srv/lsio}/fail2ban/remotelogs/vaultwarden:ro:/remotelogs/vaultwarden:ro `# Optional path to vaultwarden log folder. Mounted as Read Only. [OPTIONAL]` \
  --restart unless-stopped \
  lscr.io/linuxserver/fail2ban:latest
