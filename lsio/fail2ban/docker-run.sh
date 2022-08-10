# [Fail2ban](http://www.fail2ban.org/) is a daemon to ban hosts that cause
# multiple authentication errors.

source ./.env
docker run -d \
  --name=fail2ban \
  --net=host `# Shares host networking with container.` \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 80:80 `# Application WebUI` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/config:/config `# Contains all relevant configuration files.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/var/log:ro:/var/log:ro `# Host logs. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/airsonic/airsonic.log:ro:/remotelogs/airsonic/airsonic.log:ro `# optional` `# Optional path to airsonic log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/apache2:ro:/remotelogs/apache2:ro `# optional` `# Optional path to apache2 log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/audit/audit.log:ro:/remotelogs/audit/audit.log:ro `# optional` `# Optional path to auditd log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/authelia/authelia.log:ro:/remotelogs/authelia/authelia.log:ro `# optional` `# Optional path to authelia log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/emby/embyserver.txt:ro:/remotelogs/emby/embyserver.txt:ro `# optional` `# Optional path to emby log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/exim/mainlog:ro:/remotelogs/exim/mainlog:ro `# optional` `# Optional path to exim log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/filebrowser/filebrowser.log:ro:/remotelogs/filebrowser/filebrowser.log:ro `# optional` `# Optional path to filebrowser log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/gitea/gitea.log:ro:/remotelogs/gitea/gitea.log:ro `# optional` `# Optional path to gitea log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/homeassistant/home-assistant.log:ro:/remotelogs/homeassistant/home-assistant.log:ro `# optional` `# Optional path to homeassistant log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/lighttpd/error.log:ro:/remotelogs/lighttpd/error.log:ro `# optional` `# Optional path to lighttpd error log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nextcloud/nextcloud.log:ro:/remotelogs/nextcloud/nextcloud.log:ro `# optional` `# Optional path to nextcloud log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nginx:ro:/remotelogs/nginx:ro `# optional` `# Optional path to nginx log folder. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nzbget/nzbget.log:ro:/remotelogs/nzbget/nzbget.log:ro `# optional` `# Optional path to nzbget log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/overseerr/overseerr.log:ro:/remotelogs/overseerr/overseerr.log:ro `# optional` `# Optional path to overseerr log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/prowlarr/prowlarr.txt:ro:/remotelogs/prowlarr/prowlarr.txt:ro `# optional` `# Optional path to prowlarr log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/radarr/radarr.txt:ro:/remotelogs/radarr/radarr.txt:ro `# optional` `# Optional path to radarr log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/roundcube/errors:ro:/remotelogs/roundcube/errors:ro `# optional` `# Optional path to roundcube error log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sabnzbd/sabnzbd.log:ro:/remotelogs/sabnzbd/sabnzbd.log:ro `# optional` `# Optional path to sabnzbd log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sonarr/sonarr.txt:ro:/remotelogs/sonarr/sonarr.txt:ro `# optional` `# Optional path to sonarr log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/unificontroller/server.log:ro:/remotelogs/unificontroller/server.log:ro `# optional` `# Optional path to unificontroller server log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vaultwarden/vaultwarden.log:ro:/remotelogs/vaultwarden/vaultwarden.log:ro `# optional` `# Optional path to vaultwarden log file. Mounted as Read Only.` \
  -v ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vsftpd/vsftpd.log:ro:/remotelogs/vsftpd/vsftpd.log:ro `# optional` `# Optional path to vsftpd log file. Mounted as Read Only.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/fail2ban
