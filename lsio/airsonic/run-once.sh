ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic/config
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic/music
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic/playlists
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic/podcasts
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic/media `#optional`
