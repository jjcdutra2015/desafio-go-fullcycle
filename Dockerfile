FROM golang:alpine AS builder

WORKDIR /app
COPY . .

RUN go build hello.go

FROM scratch

WORKDIR /app
COPY --from=builder /app .

CMD ["./hello"]