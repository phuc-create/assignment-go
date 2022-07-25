# this file rule for entire project
PROJECT_NAME := assignment-go
POSTGRES_USER := postgres
POSTGRES_PASSWORD := 1

# Initialize the config for your local copy of the repo
COMPOSE := PROJECT_NAME=${PROJECT_NAME} docker-compose -f ./docker-compose.base.yaml -f ./docker-compose.ci.yaml
run:
		go run ./cmd/server/main.go

tidy-mod:
		go mod tidy
gql-server:
		go run server.go

docker-build:
		docker build -t ${PROJECT_NAME} .
docker-run:
		docker run ${PROJECT_NAME}

compose:
	docker compose -f "docker-compose.yaml" up -d --build

db-migrate:
	$(COMPOSE) run --rm db-migrate sh -c './migrate -path /migrations -database $$DB_URL up'


migrate-up:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose up

migrate-down:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose down
