# [Cops](https://github.com/mikespub-org/seblucas-cops) by Sébastien Lucas, now
# maintained by MikesPub, stands for Calibre OPDS (and HTML) Php Server. COPS
# links to your Calibre library database and allows downloading and emailing of
# books directly from a web browser and provides a OPDS feed to connect to your
# devices. Changes in your Calibre library are reflected immediately in your
# COPS pages. See : [COPS's home](https://github.com/mikespub-org/seblucas-cops)
# for more details. Don't forget to check the
# [Wiki](https://github.com/mikespub-org/seblucas-cops/wiki). ## Why? (taken
# from the author's site) In my opinion Calibre is a marvelous tool but is too
# big and has too much dependencies to be used for its content server. That's
# the main reason why I coded this OPDS server. I needed a simple tool to be
# installed on a small server (Seagate Dockstar in my case). I initially thought
# of Calibre2OPDS but as it generate static file no search was possible. Later I
# added an simple HTML catalog that should be usable on my Kobo. So COPS's main
# advantages are : * No need for many dependencies. * No need for a lot of CPU
# or RAM. * Not much code. * Search is available. * With Dropbox / owncloud it's
# very easy to have an up to date OPDS server. * It was fun to code. If you want
# to use the OPDS feed don't forget to specify /feed at the end of your URL.

. ./.env
docker run -d \
  --name=cops \
  -e PUID=${PUID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the UID to use here.` \
  -e PGID=${PGID:-1000} `# Run 'id [USER]' for the owner of the host volume directories to get the GID to use here.` \
  -e TZ=${TZ:-Etc/UTC} `# specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).` \
  -p 80:80 `# HTTP WebUI` \
  -p 443:443 `# HTTPS WebUI` \
  -v ${BASEDIR:-/srv/lsio}/cops/config:/config `# COPS Application Data.` \
  -v ${BASEDIR:-/srv/lsio}/cops/books:/books `# Calibre metadata.db location.` \
  --restart unless-stopped \
  lscr.io/linuxserver/cops:latest
