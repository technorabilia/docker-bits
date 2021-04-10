ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/tv
mkdir -p ${BASEDIR:-/volume1/docker}/sonarr/downloads
