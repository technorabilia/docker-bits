ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/emby/config
mkdir -p ${BASEDIR:-/volume1/docker}/emby/data/tvshows
mkdir -p ${BASEDIR:-/volume1/docker}/emby/data/movies
mkdir -p ${BASEDIR:-/volume1/docker}/emby/opt/vc/lib `#optional`
