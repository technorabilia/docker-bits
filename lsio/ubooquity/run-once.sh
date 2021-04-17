ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/ubooquity/config
mkdir -p ${BASEDIR:-/volume1/docker}/ubooquity/books
mkdir -p ${BASEDIR:-/volume1/docker}/ubooquity/comics
mkdir -p ${BASEDIR:-/volume1/docker}/ubooquity/files
