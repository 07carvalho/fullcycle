FROM golang:1.14-alpine as builder

WORKDIR /src
COPY hello.go .

RUN go build -o /app/hello -v ./hello.go

FROM alpine:3.12

WORKDIR /app
COPY --from=builder /app .

CMD [ "./hello" ]