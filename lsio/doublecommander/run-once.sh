ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/doublecommander/config
mkdir -p ${BASEDIR:-/volume1/docker}/doublecommander/data
