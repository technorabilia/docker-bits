ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/diskover/config
mkdir -p ${BASEDIR:-/volume1/docker}/diskover/data
