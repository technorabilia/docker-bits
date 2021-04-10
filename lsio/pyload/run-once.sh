ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pyload/config
mkdir -p ${BASEDIR:-/volume1/docker}/pyload/downloads
