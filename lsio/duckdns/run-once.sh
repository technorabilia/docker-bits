ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/duckdns/config
mkdir -p ${BASEDIR:-/srv/lsio}/duckdns/config `# [OPTIONAL]`
