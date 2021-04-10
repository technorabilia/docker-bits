ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/doublecommander/config
mkdir -p ${BASEDIR:-/volume1/docker}/doublecommander/data
