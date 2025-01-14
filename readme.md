```
# Docker Development Environment

This repository contains the Docker setup for a customizable development environment.

## Included Tools
- Debian-based environment with:
  - Build-essential
  - Java
  - PHP
  - Node.js and npm
  - MySQL client
  - Git, Vim, Curl, Wget, Unzip

## How to Use
1. Build and start the environment:
   ```bash
   docker-compose up --build -d

2. Access the container:

docker-compose exec dev-env bash

3. Mount your host project directory (./my-project) to /workingdir in the container.

Makefile Commands

make up: Build and start the environment.
make down: Stop and remove containers.
make exec: Access the container shell.
make logs: View container logs.

TODO: replace nodejs pkg with nodesource bin

```


