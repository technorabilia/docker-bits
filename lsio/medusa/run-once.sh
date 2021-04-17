ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/medusa/config
mkdir -p ${BASEDIR:-/volume1/docker}/medusa/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/medusa/tv
