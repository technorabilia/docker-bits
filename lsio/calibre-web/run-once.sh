ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/calibre-web/config
mkdir -p ${BASEDIR:-/volume1/docker}/calibre-web/books
