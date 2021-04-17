ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/cloud9/config
mkdir -p ${BASEDIR:-/volume1/docker}/cloud9/code `#optional`
mkdir -p ${BASEDIR:-/volume1/docker}/cloud9/var/run/docker.sock `#optional`
