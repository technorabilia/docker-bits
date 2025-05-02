ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/config
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/var/log:ro
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/airsonic:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/apache2:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/authelia:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/emby:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/filebrowser:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/homeassistant:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/lighttpd:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nextcloud:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nginx:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/nzbget:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/overseerr:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/prowlarr:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/radarr:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sabnzbd:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/sonarr:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/unificontroller:ro `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/fail2ban/remotelogs/vaultwarden:ro `# [OPTIONAL]`
