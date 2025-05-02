# [Folding@home](https://foldingathome.org/) is a distributed computing project
# for simulating protein dynamics, including the process of protein folding and
# the movements of proteins implicated in a variety of diseases. It brings
# together citizen scientists who volunteer to run simulations of protein
# dynamics on their personal computers. Insights from this data are helping
# scientists to better understand biology, and providing new opportunities for
# developing therapeutics.

. ./.env
docker run -d \
  --name=foldingathome \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e ACCOUNT_TOKEN= `# Register for an account on `https://app.foldingathome.org` and retrieve account token in settings. Required on first start.` \
  -e MACHINE_NAME= `# Assign a friendly name to this instance (no spaces). Required on first start.` \
  -e CLI_ARGS= `# Optionally pass additional cli arguments to `fah-client` on container start. [OPTIONAL]` \
  -p 80:80 `# Application WebUI` \
  -p 7396:7396 `# Folding@home web gui (redirects to [https://app.foldingathome.org](https://app.foldingathome.org)). [OPTIONAL]` \
  -v ${BASEDIR:-/volume1/docker}/foldingathome/config:/config `# Where Folding@home should store its database and config.` \
  --restart unless-stopped \
  lscr.io/linuxserver/foldingathome:latest
