ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/davos/config
mkdir -p ${BASEDIR:-/volume1/docker}/davos/download
