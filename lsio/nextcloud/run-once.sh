ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/nextcloud/config
mkdir -p ${BASEDIR:-/srv/lsio}/nextcloud/data
