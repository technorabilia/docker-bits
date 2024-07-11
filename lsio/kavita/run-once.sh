ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/kavita/config
mkdir -p ${BASEDIR:-/volume1/docker}/kavita/data `#optional`
