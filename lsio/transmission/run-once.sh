ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/config
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/transmission/watch
