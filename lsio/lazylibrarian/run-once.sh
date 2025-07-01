ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/lazylibrarian/config
mkdir -p ${BASEDIR:-/srv/lsio}/lazylibrarian/downloads
mkdir -p ${BASEDIR:-/srv/lsio}/lazylibrarian/books `# [OPTIONAL]`
