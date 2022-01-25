ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pyload-ng/config
mkdir -p ${BASEDIR:-/volume1/docker}/pyload-ng/downloads
