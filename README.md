# ShareLaTeX Docker Image

This repository is used to build the docker image of our sharelatex version.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Add Packages](#add-packages)

## Installation

To build the image locally, you can use the `scripts/build` script.

## Usage

### First launch

You need to execute this command to initialize the database for the first time.

```bash
docker exec mongo mongo --eval "rs.initiate({ _id: \"overleaf\", members: [ { _id: 0, host: \"mongo:27017\" } ] })"
```

### Up and down the program

Start with the `docker-compose.yaml` to adapt it to your needs. The image name is defined in the build script. You can change the version of mongo db image depending of your hardware.

You can use the scripts `scripts/up` and `scripts/down` in order to launch the app, using the docker compose.

## Add Packages

You can install new packages in this image, you have to add the package names in the `Dockerfile` after the `tlmgr install` command.
