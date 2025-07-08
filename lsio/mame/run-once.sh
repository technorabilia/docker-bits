ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/mame/config
mkdir -p ${BASEDIR:-/srv/lsio}/mame/mame:ro
