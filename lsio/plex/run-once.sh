ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/plex/config
mkdir -p ${BASEDIR:-/srv/lsio}/plex/tv
mkdir -p ${BASEDIR:-/srv/lsio}/plex/movies
