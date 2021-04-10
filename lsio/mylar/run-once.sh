ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/mylar/config
mkdir -p ${BASEDIR:-/volume1/docker}/mylar/comics
mkdir -p ${BASEDIR:-/volume1/docker}/mylar/downloads
