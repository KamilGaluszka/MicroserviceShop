$env:COMPOSE_PROJECT_NAME = "microserviceShop-catalog"

try {
	docker-compose up -d mongo
	docker-compose up -d mongo-express
	Read-Host -Prompt "Press Enter to exit"
}
finally {
	docker-compose down --remove-orphans --rmi local
}