ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/config
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/tv `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/downloads `# [OPTIONAL]`
