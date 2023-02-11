# [Your_spotify](https://github.com/Yooooomi/your_spotify) is a self-hosted
# application that tracks what you listen and offers you a dashboard to explore
# statistics about it! It's composed of a web server which polls the Spotify API
# every now and then and a web application on which you can explore your
# statistics.

source ./.env
docker run -d \
  --name=your_spotify \
  -e PUID=${PUID:-1024} `# for UserID` \
  -e PGID=${PGID:-100} `# for GroupID` \
  -e TZ=${TZ:-Europe/Amsterdam} `# Specify a timezone to use for example Europe/Amsterdam` \
  -e APP_URL=http://localhost `# The protocol and hostname where the app will be accessed.` \
  -e SPOTIFY_PUBLIC= `# Your Spotify application client ID.` \
  -e SPOTIFY_SECRET= `# Your Spotify application secret.` \
  -e CORS=http://localhost:80,https://localhost:443 `# Allowed CORS sources, set to `all` to allow any source.` \
  -e MONGO_ENDPOINT=mongodb://mongo:27017/your_spotify `# Set mongodb endpoint address/port.` \
  -p 80:80 `# your_spotify HTTP webui` \
  -p 443:443 `# your_spotify HTTPS webui` \
  --restart unless-stopped \
  ghcr.io/linuxserver/your_spotify
