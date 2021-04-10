ln -s ../docker-env.cfg ./.env
source ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/couchpotato/config
mkdir -p ${BASEDIR:-/volume1/docker}/couchpotato/downloads
mkdir -p ${BASEDIR:-/volume1/docker}/couchpotato/movies
