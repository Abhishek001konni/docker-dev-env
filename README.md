# Dockerized Development Environment

This repository contains a Docker setup for my customizable development environment.

## Included Tools
- Debian-based environment with:
  - Build-essential
  - Java (default-jdk)
  - PHP
  - Node.js and npm
  - MySQL client
  - Git, Vim, Curl, Wget, Unzip
  - Zsh

## How to Use

1. Build and start the environment:

   `docker-compose up --build -d`

2. Access the container shell:
 
   `docker-compose exec dev-env zsh`

3. Mount your host project directory (default: `./projects`) to `/home/devuser/projects` in the container.

   - The mount path is now `/home/devuser/projects`, not `/workingdir`.
   
## Makefile Commands

- Build and start the environment: 
`make up`

- Stop and remove containers: 
 `make down `

- Access the container shell: 
`make exec`

- View container logs: 
`make logs`

- View available commands
`make help`

## Environment Variables

Create a `.env` file in the root directory and set the following environment variables(change accordingly):

```
# MySQL Configuration
MYSQL_PORT=3307         # Port exposed to the host for MySQL (mapped from 3306 in the container)
MYSQL_ROOT_PASSWORD=root   # MySQL root password for the database
MYSQL_DATABASE=dev_database # Default database to create in MySQL
MYSQL_USER=devuser          # Non-root database user
MYSQL_PASSWORD=devpassword  # Password for the non-root user

# Application Configuration
APP_PORT=8080        # Application port exposed to the host

#Default path
PROJECT_DIR=./projects
MYSQL_DATA=mysql-data

# Host User/Group IDs (for correct file permissions)
USER_ID=1000
GROUP_ID=100
```

## Services

- dev-env: The main development environment.
- mysql: MySQL database service.

### Volumes
- `${PROJECT_DIR:-./projects}:/home/devuser/projects`: Mounts your project directory to the container.
- `mysql-data:/var/lib/mysql`: Persists the MySQL database data.

### Network

- `dev-network`: Custom isolated network for all services.

### Ownership & Permissions

- The container’s entrypoint script ensures `/home/devuser/projects` is owned by the correct user/group matching your host (using `USER_ID`, `GROUP_ID`).  
- This ensures files created in the container remain editable on your host.

### Healthchecks

- dev-env: Checks the application URL or command.
- mysql: Pings the MySQL service.

### Restart Policies

- Both `dev-env` and `mysql` services will restart unless stopped manually.

