ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/gazee/config
mkdir -p ${BASEDIR:-/volume1/docker}/gazee/comics
mkdir -p ${BASEDIR:-/volume1/docker}/gazee/mylar
mkdir -p ${BASEDIR:-/volume1/docker}/gazee/certs
