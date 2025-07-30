FROM golang:1.23-alpine AS builder

WORKDIR /app

RUN go install github.com/shinagawa-web/gomarklint@latest

FROM alpine:latest
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/bin/gomarklint /usr/local/bin/gomarklint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
