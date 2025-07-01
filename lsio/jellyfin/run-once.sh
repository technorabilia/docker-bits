ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/jellyfin/config
mkdir -p ${BASEDIR:-/srv/lsio}/jellyfin/data/tvshows
mkdir -p ${BASEDIR:-/srv/lsio}/jellyfin/data/movies
