ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pydio/config
mkdir -p ${BASEDIR:-/volume1/docker}/pydio/data
