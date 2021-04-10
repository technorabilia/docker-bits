ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/mstream/config
mkdir -p ${BASEDIR:-/volume1/docker}/mstream/music
