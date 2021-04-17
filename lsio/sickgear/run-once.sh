ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/sickgear/config
mkdir -p ${BASEDIR:-/volume1/docker}/sickgear/tv
mkdir -p ${BASEDIR:-/volume1/docker}/sickgear/downloads
