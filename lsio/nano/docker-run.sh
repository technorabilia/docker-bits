# [Nano](https://nano.org/) is a digital payment protocol designed to be
# accessible and lightweight, with a focus on removing inefficiencies present in
# other cryptocurrencies. With ultrafast transactions and zero fees on a secure,
# green and decentralized network, this makes Nano ideal for everyday
# transactions.

. ./.env
docker run -d \
  --name=nano \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e PEER_HOST=localhost `# optional` `# Default peer host (can be overidden with an array by command line options)` \
  -e LIVE_GENESIS_PUB=GENESIS_PUBLIC `# optional` `# Genesis block public key` \
  -e LIVE_GENESIS_ACCOUNT=nano_xxxxxx `# optional` `# Genesis block account` \
  -e LIVE_GENESIS_WORK=WORK_FOR_BLOCK `# optional` `# Genesis block proof of work` \
  -e LIVE_GENESIS_SIG=BLOCK_SIGNATURE `# optional` `# Genesis block signature` \
  -e CLI_OPTIONS=--config node.enable_voting=true `# optional` `# Node run command cli args` \
  -e LMDB_BOOTSTRAP_URL=http://example.com/Nano_64_version_20.7z `# optional` `# HTTP/HTTPS endpoint to download a 7z file with the data.ldb to bootstrap to this node` \
  -p 8075:8075 `# Nano communication port` \
  -p 7076:3000 `# RPC interface filtered through a proxy` \
  -p 7077:3001 `# Https RPC interface filtered through a proxy` \
  -v ${BASEDIR:-/volume1/docker}/nano/config:/config `# Main storage for config and blockchain` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nano
