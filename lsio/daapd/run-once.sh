ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/daapd/config
mkdir -p ${BASEDIR:-/volume1/docker}/daapd/music
