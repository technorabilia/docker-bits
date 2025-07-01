ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/pyload-ng/config
mkdir -p ${BASEDIR:-/srv/lsio}/pyload-ng/downloads
