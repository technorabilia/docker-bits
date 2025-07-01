ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/lidarr/config
mkdir -p ${BASEDIR:-/srv/lsio}/lidarr/music `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/lidarr/downloads `# [OPTIONAL]`
