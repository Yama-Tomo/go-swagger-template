FROM golang:1.16-alpine as golang


### ビルド用環境 ###
FROM golang as builder

WORKDIR /builder

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build cmd/example-api-server/main.go


### 本番環境 ###
FROM alpine as prod

WORKDIR /app

RUN apk add --no-cache ca-certificates
COPY --from=builder /builder/main /app/

EXPOSE 8080
CMD ["/app/main"]


### 開発環境 ##
FROM golang as dev

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY Makefile .

RUN apk add make gcc musl-dev
RUN go mod download
RUN make install-tools

EXPOSE 8080

CMD ["air", "-c", ".air.toml"]

