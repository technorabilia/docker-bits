ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/lychee/config
mkdir -p ${BASEDIR:-/volume1/docker}/lychee/pictures
