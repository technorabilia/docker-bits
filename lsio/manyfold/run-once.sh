ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/manyfold/config
mkdir -p ${BASEDIR:-/volume1/docker}/manyfold/libraries `#optional`
