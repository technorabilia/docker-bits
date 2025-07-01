ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/smokeping/config
mkdir -p ${BASEDIR:-/srv/lsio}/smokeping/data
