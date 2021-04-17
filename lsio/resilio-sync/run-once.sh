ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/resilio-sync/config
mkdir -p ${BASEDIR:-/volume1/docker}/resilio-sync/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/resilio-sync/sync
