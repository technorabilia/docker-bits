ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/rutorrent/config
mkdir -p ${BASEDIR:-/volume1/docker}/rutorrent/downloads
