.PHONY: up down stop start restart exec clean logs help test

# Default target
.DEFAULT_GOAL := help

up:
	@docker-compose up --build -d

down:
	@docker-compose down

stop:
	@docker-compose stop

start:
	@docker-compose start

restart:
	@docker-compose restart

exec:
	@docker-compose exec dev-env zsh

clean:
	@docker-compose down --rmi all --volumes --remove-orphans
	@docker volume prune -f

logs:
	@docker-compose logs -f

help:
	@echo "  up      - Build and start the containers"
	@echo "  down    - Stop and remove the containers"
	@echo "  stop    - Stop Containers without removing volumes"
	@echo "  start   - Start existing stopped containers"
	@echo "  restart - Restart all services"
	@echo "  exec    - Open a zsh shell in the dev-env container"
	@echo "  clean   - Remove all containers, images, and volumes"
	@echo "  logs    - Tail the logs of services"

test:
	@echo "Running tests for the development environment..."
	@php -v && node -v && mysql --version || (echo "Tool verification failed!" && exit 1)
	@echo "All tests passed successfully!"

