ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/scrutiny/config
mkdir -p ${BASEDIR:-/volume1/docker}/scrutiny/run/udev:ro
