ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/cops/config
mkdir -p ${BASEDIR:-/srv/lsio}/cops/books
