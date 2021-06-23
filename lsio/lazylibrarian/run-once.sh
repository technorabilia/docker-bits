ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/lazylibrarian/config
mkdir -p ${BASEDIR:-/volume1/docker}/lazylibrarian/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/lazylibrarian/books `#optional`
