ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/syncthing/config
mkdir -p ${BASEDIR:-/volume1/docker}/syncthing/data1
mkdir -p ${BASEDIR:-/volume1/docker}/syncthing/data2
