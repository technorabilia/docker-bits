ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/tvheadend/config
mkdir -p ${BASEDIR:-/srv/lsio}/tvheadend/recordings
