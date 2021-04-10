# Nano-wallet is a digital payment protocol designed to be accessible and
# lightweight, with a focus on removing inefficiencies present in other
# cryptocurrencies. With ultrafast transactions and zero fees on a secure, green
# and decentralized network, this makes Nano ideal for everyday transactions.
# This container is a simple nginx wrapper for the light wallet located
# [here](https://github.com/linuxserver/nano-wallet). You will need to pass a
# valid RPC host when accessing this container.

source ./.env
docker run -d \
  --name=nano-wallet \
  -p 80:80 `# Webserver port` \
  --restart unless-stopped \
  ghcr.io/linuxserver/nano-wallet
