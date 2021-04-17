ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pyload/config
mkdir -p ${BASEDIR:-/volume1/docker}/pyload/downloads
