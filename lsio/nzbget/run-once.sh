ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/nzbget/config
mkdir -p ${BASEDIR:-/volume1/docker}/nzbget/downloads `#optional`
