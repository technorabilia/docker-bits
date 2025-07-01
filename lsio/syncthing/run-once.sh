ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/syncthing/config
mkdir -p ${BASEDIR:-/srv/lsio}/syncthing/data1
mkdir -p ${BASEDIR:-/srv/lsio}/syncthing/data2
