ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/smokeping/config
mkdir -p ${BASEDIR:-/volume1/docker}/smokeping/data
