ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/tvheadend/config
mkdir -p ${BASEDIR:-/volume1/docker}/tvheadend/recordings
