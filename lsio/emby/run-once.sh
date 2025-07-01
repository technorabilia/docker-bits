ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/emby/config
mkdir -p ${BASEDIR:-/srv/lsio}/emby/data/tvshows
mkdir -p ${BASEDIR:-/srv/lsio}/emby/data/movies
