# this file rule for entire project
PROJECT_NAME := assignment-go
POSTGRES_USER := postgres
POSTGRES_PASSWORD := 1

# Initialize the config for your local copy of the repo

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

db-migrate:
		migrate -source file://data/migrations -database $$DB_URL up 2
