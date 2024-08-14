FROM golang:1.23.0-alpine3.20 AS builder

WORKDIR /app

COPY hello.go .

COPY go.mod .

RUN go build -ldflags="-s -w" -o hello .

FROM scratch

COPY --from=builder /app .

ENTRYPOINT ["/hello"]