ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/hydra/config
mkdir -p ${BASEDIR:-/volume1/docker}/hydra/downloads
