ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/cops/config
mkdir -p ${BASEDIR:-/volume1/docker}/cops/books
