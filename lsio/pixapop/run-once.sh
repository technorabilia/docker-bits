ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/pixapop/config
mkdir -p ${BASEDIR:-/volume1/docker}/pixapop/photos
