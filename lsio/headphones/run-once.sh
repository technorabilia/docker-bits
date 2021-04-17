ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/headphones/config
mkdir -p ${BASEDIR:-/volume1/docker}/headphones/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/headphones/music
