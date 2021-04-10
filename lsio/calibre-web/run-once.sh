ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/calibre-web/config
mkdir -p ${BASEDIR:-/volume1/docker}/calibre-web/books
