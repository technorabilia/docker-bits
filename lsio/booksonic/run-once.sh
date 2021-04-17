ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic/config
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic/audiobooks
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic/podcasts
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic/othermedia
