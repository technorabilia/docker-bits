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
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e CLI_ARGS= `# optional` `# Optionally pass additional cli arguments to `FAHClient` on container start.` \
  -p 7396:7396 `# Folding@home web gui.` \
  -p 36330:36330 `# optional` `# Optional port for connecting remotely via FAHControl app (no password).` \
  -v ${BASEDIR:-/volume1/docker}/foldingathome/config:/config `# Where Folding@home should store its database and config.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/foldingathome
