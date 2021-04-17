ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/papermerge/config
mkdir -p ${BASEDIR:-/volume1/docker}/papermerge/data
