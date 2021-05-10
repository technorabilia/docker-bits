ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/radarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/radarr/movies `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/radarr/downloads `#optional`
