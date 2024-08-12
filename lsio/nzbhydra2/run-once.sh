ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/nzbhydra2/config
mkdir -p ${BASEDIR:-/volume1/docker}/nzbhydra2/downloads `#optional`
