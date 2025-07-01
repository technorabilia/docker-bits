ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/medusa/config
mkdir -p ${BASEDIR:-/srv/lsio}/medusa/downloads
mkdir -p ${BASEDIR:-/srv/lsio}/medusa/tv
