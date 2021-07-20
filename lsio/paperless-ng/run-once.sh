ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/paperless-ng/config
mkdir -p ${BASEDIR:-/volume1/docker}/paperless-ng/data
