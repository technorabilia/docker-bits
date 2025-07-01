ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/beets/config
mkdir -p ${BASEDIR:-/srv/lsio}/beets/music
mkdir -p ${BASEDIR:-/srv/lsio}/beets/downloads
