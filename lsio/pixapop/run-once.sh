ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pixapop/config
mkdir -p ${BASEDIR:-/volume1/docker}/pixapop/photos
