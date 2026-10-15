ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/audiosilo/config
mkdir -p ${BASEDIR:-/srv/lsio}/audiosilo/audiobooks:ro
