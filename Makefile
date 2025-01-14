 up:
	@docker-compose up --build -d

down:
	@docker-compose down

exec:
	@docker-compose exec dev-env bash

logs:
	@docker-compose logs -f
 
