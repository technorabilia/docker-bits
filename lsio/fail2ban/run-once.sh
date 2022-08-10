ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/config
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/var/log:ro
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/airsonic/airsonic.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/apache2:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/audit/audit.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/authelia/authelia.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/emby/embyserver.txt:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/exim/mainlog:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/filebrowser/filebrowser.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/gitea/gitea.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/homeassistant/home-assistant.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/lighttpd/error.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nextcloud/nextcloud.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nginx:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nzbget/nzbget.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/overseerr/overseerr.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/prowlarr/prowlarr.txt:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/radarr/radarr.txt:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/roundcube/errors:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sabnzbd/sabnzbd.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sonarr/sonarr.txt:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/unificontroller/server.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vaultwarden/vaultwarden.log:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vsftpd/vsftpd.log:ro `#optional`
