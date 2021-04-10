ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/qbittorrent/config
mkdir -p ${BASEDIR:-/volume1/docker}/qbittorrent/downloads
