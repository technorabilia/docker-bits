ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/tvheadend/config
mkdir -p ${BASEDIR:-/volume1/docker}/tvheadend/recordings
