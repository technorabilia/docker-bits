ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/emby/config
mkdir -p ${BASEDIR:-/volume1/docker}/emby/data/tvshows
mkdir -p ${BASEDIR:-/volume1/docker}/emby/data/movies
