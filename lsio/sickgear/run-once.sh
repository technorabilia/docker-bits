ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sickgear/config
mkdir -p ${BASEDIR:-/srv/lsio}/sickgear/tv
mkdir -p ${BASEDIR:-/srv/lsio}/sickgear/downloads
