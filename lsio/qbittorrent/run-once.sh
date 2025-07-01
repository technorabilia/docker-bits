ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/qbittorrent/config
mkdir -p ${BASEDIR:-/srv/lsio}/qbittorrent/downloads `# [OPTIONAL]`
