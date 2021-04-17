ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/wikijs/config
mkdir -p ${BASEDIR:-/volume1/docker}/wikijs/data
