ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/nzbget/config
mkdir -p ${BASEDIR:-/volume1/docker}/nzbget/downloads
