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

# err
gql-server:
	go run server.go

docker-build:
	docker build -t ${PROJECT_NAME} .
docker-run:
	docker run ${PROJECT_NAME}


dropdb:
	docker exec -it [CONTAINER_ID] psql -U postgres -d postgres -c "DROP DATABASE assignment;"

# db-migrate:
# 	$(COMPOSE) run --rm db-migrate sh -c './migrate -path /migrations -database $$DB_URL up'
## Start local development step by step
#1
init:
	docker compose -f "docker-compose.yaml" up -d --build
# access localhost:5050 to access DB => use username & password in docker-compose file to login
# register server and fill following infor to register
# get IP to register a server:
#		- docker ps (copy postgres DB CONTAINER_ID)
#		- docker inspect [CONTAINER_ID]
#		- copy IP V4 Address and paste in pgAdmin host field and click register

#2
migratedown:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose down
#3
migrateup:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose up

migrate-f:
	migrate -source file://data/migrations \
					-database "postgres://postgres:postgres@localhost:5432/assignment?sslmode=disable" -verbose force 0


# for generate graphql code go lang
generate:
	go run github.com/99designs/gqlgen generate
