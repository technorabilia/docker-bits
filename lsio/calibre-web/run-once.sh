ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/calibre-web/config
mkdir -p ${BASEDIR:-/srv/lsio}/calibre-web/books
