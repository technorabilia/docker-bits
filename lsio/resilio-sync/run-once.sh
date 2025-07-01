ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/resilio-sync/config
mkdir -p ${BASEDIR:-/srv/lsio}/resilio-sync/downloads
mkdir -p ${BASEDIR:-/srv/lsio}/resilio-sync/sync
