ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/jellyfin/config
mkdir -p ${BASEDIR:-/volume1/docker}/jellyfin/data/tvshows
mkdir -p ${BASEDIR:-/volume1/docker}/jellyfin/data/movies
