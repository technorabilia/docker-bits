# [Folding@home]({{ project_url }}) is a distributed computing project for
# simulating protein dynamics, including the process of protein folding and the
# movements of proteins implicated in a variety of diseases. It brings together
# citizen scientists who volunteer to run simulations of protein dynamics on
# their personal computers. Insights from this data are helping scientists to
# better understand biology, and providing new opportunities for developing
# therapeutics.

source ./.env
docker run -d \
  --name=foldingathome \
  -e PUID=${PUID:-1024} `# for GroupID` \
  -e PGID=${PGID:-100} `# for UserID` \
  -e TZ=Europe/Amsterdam `# Specify a timezone to use for example Europe/Amsterdam` \
  -p 7396:7396 `# Folding@home web gui.` \
  -p 36330:36330 `# optional` `# Optional port for connecting remotely via FAHControl app (no password).` \
  -v ${BASEDIR:-/volume1/docker}/foldingathome/config:/config `# Where Folding@home should store its database and config.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/foldingathome
