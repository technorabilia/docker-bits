ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/piwigo/config
mkdir -p ${BASEDIR:-/srv/lsio}/piwigo/gallery
