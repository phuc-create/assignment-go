# this file rule for entire project
PROJECT_NAME := assignment-go
POSTGRES_USER := postgres
POSTGRES_PASSWORD := 1

# Initialize the config for your local copy of the repo
COMPOSE := PROJECT_NAME=${PROJECT_NAME} docker-compose -f ./docker-compose.base.yaml -f ./docker-compose.ci.yaml
run:
	go run ./cmd/server/main.go

tidy:
	go mod tidy
gql-server:
	go run server.go

docker-build:
	docker build -t ${PROJECT_NAME} .
docker-run:
	docker run ${PROJECT_NAME}

init:
	docker compose -f "docker-compose.yaml" up -d --build

# db-migrate:
# 	$(COMPOSE) run --rm db-migrate sh -c './migrate -path /migrations -database $$DB_URL up'

dropdb:
	docker exec -it 8a562ddc70a8 psql -U postgres -d postgres -c "DROP DATABASE assignment;"
migrateup:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose up

# migrateup-force:
# 	migrate -source file://data/migrations \
# 					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose force 0

migratedown:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose down

# for generate graphql code go lang
generate:
	go run github.com/99designs/gqlgen generate
