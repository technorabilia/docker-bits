ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/transmission/config
mkdir -p ${BASEDIR:-/srv/lsio}/transmission/downloads `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/transmission/watch `# [OPTIONAL]`
