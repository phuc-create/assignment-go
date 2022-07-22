ARG IMAGE_NAME=migrate/migrate
ARG IMAGE_TAG=v4.14.1

FROM ${IMAGE_NAME}:${IMAGE_TAG}

COPY ./data/migrations /migrations
