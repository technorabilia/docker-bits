ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/plex/config
mkdir -p ${BASEDIR:-/volume1/docker}/plex/tv
mkdir -p ${BASEDIR:-/volume1/docker}/plex/movies
