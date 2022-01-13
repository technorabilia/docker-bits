ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic-advanced/config
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic-advanced/music
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic-advanced/playlists
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic-advanced/podcasts
mkdir -p ${BASEDIR:-/volume1/docker}/airsonic-advanced/media `#optional`
