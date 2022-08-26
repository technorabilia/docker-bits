ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/config
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/var/log:ro
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/airsonic:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/apache2:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/authelia:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/emby:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/filebrowser:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/homeassistant:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/lighttpd:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nextcloud:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nginx:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nzbget:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/overseerr:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/prowlarr:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/radarr:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sabnzbd:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sonarr:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/unificontroller:ro `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vaultwarden:ro `#optional`
