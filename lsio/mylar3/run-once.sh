ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/mylar3/config
mkdir -p ${BASEDIR:-/volume1/docker}/mylar3/comics
mkdir -p ${BASEDIR:-/volume1/docker}/mylar3/downloads
