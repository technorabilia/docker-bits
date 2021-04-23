ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/webtop/config
mkdir -p ${BASEDIR:-/volume1/docker}/webtop/var/run/docker.sock `#optional`
