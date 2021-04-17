ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic-air/config
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic-air/audiobooks
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic-air/podcasts
mkdir -p ${BASEDIR:-/volume1/docker}/booksonic-air/othermedia
