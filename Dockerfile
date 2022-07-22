ARG IMAGE_TAG=golang
ARG VERSION=1.18-alpine3.16

FROM ${IMAGE_TAG}:${VERSION} AS builder

WORKDIR /app
COPY . .
RUN go build -o main ./cmd/server/main.go
# stage
FROM alpine:3.13
WORKDIR /app
COPY --from=builder /app/main .
RUN apk add --no-cache ca-certificates

ENV GOLANG_VERSION 1.18.3

EXPOSE 8080
CMD ["/app/main"]


