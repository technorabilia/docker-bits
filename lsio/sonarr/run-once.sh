ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/tv `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/downloads `#optional`
