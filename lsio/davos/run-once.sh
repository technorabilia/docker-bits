ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/davos/config
mkdir -p ${BASEDIR:-/srv/lsio}/davos/download
