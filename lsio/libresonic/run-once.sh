ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/libresonic/config
mkdir -p ${BASEDIR:-/volume1/docker}/libresonic/music
mkdir -p ${BASEDIR:-/volume1/docker}/libresonic/playlists
mkdir -p ${BASEDIR:-/volume1/docker}/libresonic/podcasts
mkdir -p ${BASEDIR:-/volume1/docker}/libresonic/media `#optional`
