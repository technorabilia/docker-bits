ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/jackett/config
mkdir -p ${BASEDIR:-/volume1/docker}/jackett/downloads
