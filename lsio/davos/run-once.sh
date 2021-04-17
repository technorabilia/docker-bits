ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/davos/config
mkdir -p ${BASEDIR:-/volume1/docker}/davos/download
