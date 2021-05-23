ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/piwigo/config
mkdir -p ${BASEDIR:-/volume1/docker}/piwigo/gallery
