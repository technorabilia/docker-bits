# [Your_spotify](https://github.com/Yooooomi/your_spotify) is a self-hosted
# application that tracks what you listen and offers you a dashboard to explore
# statistics about it! It's composed of a web server which polls the Spotify API
# every now and then and a web application on which you can explore your
# statistics.

. ./.env
docker run -d \
  --name=your_spotify \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -e APP_URL=http://localhost `# The protocol and hostname where the app will be accessed.` \
  -e SPOTIFY_PUBLIC= `# Your Spotify application client ID.` \
  -e SPOTIFY_SECRET= `# Your Spotify application secret.` \
  -e CORS=http://localhost:80,https://localhost:443 `# Allowed CORS sources, set to `all` to allow any source.` \
  -e MONGO_ENDPOINT=mongodb://mongo:27017/your_spotify `# Set mongodb endpoint address/port.` \
  -p 80:80 `# your_spotify HTTP webui` \
  -p 443:443 `# your_spotify HTTPS webui` \
  -v ${BASEDIR:-/volume1/docker}/your_spotify/config:/config `# Configuration files.` \
  --restart unless-stopped \
  ghcr.io/linuxserver/your_spotify
