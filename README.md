# Docker scripts for LinuxServer.io Docker containers
These scripts allow you to easily deploy [LinuxServer.io Docker containers](https://hub.docker.com/u/linuxserver/) using predefined settings.

The scripts are automatically generated based on data from the [LinuxServer.io GitHub repositories](https://github.com/linuxserver).

Please keep the following in mind:
- The templates are not supported by LinuxServer.io.
- The templates are generated automatically, so requests to add specific templates cannot be accepted.

## Prerequisites
- A server with Docker installed  
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed  

If you do not have Git installed, you can download the ZIP file directly from the GitHub repository.

## Install the scripts
Clone the repository (or download the ZIP from [here](https://github.com/technorabilia/docker-bits/archive/refs/heads/main.zip)):

```bash
git clone https://github.com/technorabilia/docker-bits.git
````

After cloning the repository, navigate to the `lsio` directory:

```bash
cd docker-bits/lsio
```

You will find one file `docker-env.cfg` and multiple directories. Each directory represents a supported application.

```markdown
docker-env.cfg
```

If needed, adjust the base directory for your volume host directories, Process User ID (`PUID`), Process Group ID (`PGID`), and timezone (`TZ`).

More information on `PUID` and `PGID` can be found [here](https://docs.linuxserver.io/general/understanding-puid-and-pgid).

When modifying a variable, ensure you uncomment the line by removing the `#`.

If no values are set, the Docker scripts will fall back to the defaults shown below:

```bash
#BASEDIR=/volume1/docker
#PUID=1000
#PGID=1000
#TZ=Etc/UTC
```

## Application list
All applications listed [here](https://www.linuxserver.io/our-images) are available as scripts.

## How to use the scripts
As an example, we will look at the scripts for Sonarr.

After cloning the repository, change into the Sonarr directory:

```bash
cd docker-bits/lsio/sonarr
```

You will see three files:

```markdown
run-once.sh
docker-compose.yaml
docker-run.sh
```

### run-once.sh
The `run-once.sh` script links the general settings from `docker-env.cfg` and creates the required volume directories:

```bash
ln -s ../docker-env.cfg ./.env
. ./.env
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/config
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/tv `# [OPTIONAL]`
mkdir -p ${BASEDIR:-/srv/lsio}/sonarr/downloads `# [OPTIONAL]`
```

Run the script:

```bash
sh run-once.sh
```

As the name implies, this only needs to be executed once. You may delete the script afterwards if desired.

### docker-compose.yaml
You can use the `docker-compose.yaml` file with [docker-compose](https://docs.docker.com/compose/reference/overview/):

```yaml
---
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    environment:
      - PUID=${PUID:-1000}
      - PGID=${PGID:-1000}
      - TZ=${TZ:-Etc/UTC}
    volumes:
      - ${BASEDIR:-/srv/lsio}/sonarr/config:/config
      - ${BASEDIR:-/srv/lsio}/sonarr/tv:/tv
      - ${BASEDIR:-/srv/lsio}/sonarr/downloads:/downloads
    ports:
      - 8989:8989
    restart: unless-stopped
```

Start the Sonarr container:

```bash
docker-compose up -d
```

Using `docker-compose` is the recommended approach.

### docker-run.sh
Alternatively, you can use `docker run` through the provided `docker-run.sh` script:

```bash
. ./.env
docker run -d \
  --name=sonarr \
  -e PUID=${PUID:-1000} \
  -e PGID=${PGID:-1000} \
  -e TZ=${TZ:-Etc/UTC} \
  -p 8989:8989 \
  -v ${BASEDIR:-/srv/lsio}/sonarr/config:/config \
  -v ${BASEDIR:-/srv/lsio}/sonarr/tv:/tv \
  -v ${BASEDIR:-/srv/lsio}/sonarr/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/sonarr:latest
```

Start the container:

```bash
sh docker-run.sh
```

### Example output
For `docker-compose`:

```bash
$ cd ./docker-bits/lsio/sonarr
$ sh run-once.sh
$ docker-compose up -d
Creating network "sonarr_default" with the default driver
Creating sonarr ... done
$ docker-compose down
Stopping sonarr ... done
Removing sonarr ... done
Removing network sonarr_default
$
```

For `docker run`:

```bash
$ sh docker-run.sh
2d27e4520e57420c12742cbc152aa8bd849f82fcad6aa32bd77f1017f0e15f95
$ docker rm -f sonarr
sonarr
$
```

## Report issues
If you encounter a problem, please report it on the project's [GitHub Issues page](https://github.com/technorabilia/docker-bits/issues). Issues will be reviewed as soon as possible.

## Considerations
* With the default volume structure recommended by LinuxServer.io, you cannot use hard links. More information is available [here](https://docs.linuxserver.io/images/docker-sonarr#application-setup).
* The scripts are updated daily.

## Credits
A big thank you to [LinuxServer.io](https://www.linuxserver.io/) for their outstanding work. Without their efforts, this project would not be possible.
