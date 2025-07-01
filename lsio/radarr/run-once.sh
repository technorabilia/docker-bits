ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/radarr/config
mkdir -p ${BASEDIR:-/srv/lsio}/radarr/movies `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/radarr/downloads `# [OPTIONAL]`
