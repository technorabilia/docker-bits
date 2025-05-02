ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/config
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/downloads `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/watch `# [OPTIONAL]`
