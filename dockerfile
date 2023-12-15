FROM alpinelinux/golang:latest AS builder

WORKDIR /app

COPY . .

RUN go build -o full-cycle-rocks

FROM scratch

WORKDIR /app

COPY --from=builder /app/full-cycle-rocks .

ENTRYPOINT [ "./full-cycle-rocks" ]