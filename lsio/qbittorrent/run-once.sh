ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/qbittorrent/config
mkdir -p ${BASEDIR:-/volume1/docker}/qbittorrent/downloads `#optional`
