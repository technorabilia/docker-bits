ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sealskin/config
mkdir -p ${BASEDIR:-/srv/lsio}/sealskin/storage
