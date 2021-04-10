ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/smokeping/config
mkdir -p ${BASEDIR:-/volume1/docker}/smokeping/data
