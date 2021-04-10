ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/beets/config
mkdir -p ${BASEDIR:-/volume1/docker}/beets/music
mkdir -p ${BASEDIR:-/volume1/docker}/beets/downloads
