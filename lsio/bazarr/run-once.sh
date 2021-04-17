ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/movies `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/bazarr/tv `#optional`
