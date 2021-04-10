ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/deluge/config
mkdir -p ${BASEDIR:-/volume1/docker}/deluge/downloads
