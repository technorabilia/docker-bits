ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/flexget/config
mkdir -p ${BASEDIR:-/volume1/docker}/flexget/data `#optional`
