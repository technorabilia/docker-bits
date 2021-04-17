ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pylon/config
mkdir -p ${BASEDIR:-/volume1/docker}/pylon/code `#optional`
