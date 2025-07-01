ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/mstream/config
mkdir -p ${BASEDIR:-/srv/lsio}/mstream/music
