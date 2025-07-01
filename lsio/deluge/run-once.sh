ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/deluge/config
mkdir -p ${BASEDIR:-/srv/lsio}/deluge/downloads
