FROM golang:1.22-alpine as BUILDER

WORKDIR /usr/src/app

COPY go-app/ .

RUN go build -o main


FROM scratch

COPY --from=builder usr/src/app/main .

CMD ["./main"]