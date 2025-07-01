ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/ubooquity/config
mkdir -p ${BASEDIR:-/srv/lsio}/ubooquity/books
mkdir -p ${BASEDIR:-/srv/lsio}/ubooquity/comics
mkdir -p ${BASEDIR:-/srv/lsio}/ubooquity/files
