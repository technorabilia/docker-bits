ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/volume1/docker}/duckdns/config
mkdir -p ${BASEDIR:-/volume1/docker}/duckdns/config `#optional`
