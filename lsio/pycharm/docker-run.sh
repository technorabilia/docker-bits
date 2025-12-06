# [PyCharm](https://www.jetbrains.com/pycharm/) offers out-of-the-box support
# for Python, databases, Jupyter, Git, Conda, PyTorch, TensorFlow, Hugging Face,
# Django, Flask, FastAPI, and more.

. ./.env
docker run -d \
  --name=pycharm \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 3000:3000 `# PyCharm desktop gui HTTP must be proxied.` \
  -p 3001:3001 `# PyCharm desktop gui HTTPS.` \
  -v ${BASEDIR:-/srv/lsio}/pycharm/config:/config `# Users home directory in the container, stores local files and settings` \
  --shm-size="1gb" \
  --restart unless-stopped \
  lscr.io/linuxserver/pycharm:latest
