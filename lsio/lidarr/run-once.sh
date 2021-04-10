ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/config
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/music
mkdir -p ${BASEDIR:-/volume1/docker}/lidarr/downloads
