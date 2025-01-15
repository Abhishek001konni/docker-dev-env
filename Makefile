up:
	@docker-compose up --build -d

down:
	@docker-compose down

stop:
	@docker-compose stop

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
	@echo "  exec    - Open a zsh shell in the dev-env container"
	@echo "  clean   - Remove all containers, images, and volumes"
	@echo "  logs    - Tail the logs of services"

