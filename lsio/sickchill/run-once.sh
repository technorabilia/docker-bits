ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/sickchill/config
mkdir -p ${BASEDIR:-/volume1/docker}/sickchill/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/sickchill/tv
