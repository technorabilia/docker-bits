ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/emulatorjs/config
mkdir -p ${BASEDIR:-/volume1/docker}/emulatorjs/data
