ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/jackett/config
mkdir -p ${BASEDIR:-/srv/lsio}/jackett/downloads
