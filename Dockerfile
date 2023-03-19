FROM golang AS builder

WORKDIR /usr/src/app

COPY ./app .

RUN go build -ldflags "-s -w" fullcycle.go
#CMD ["go", "run", "fullcycle.go"]

FROM scratch

WORKDIR /app

COPY --from=builder /usr/src/app/fullcycle .

CMD ["/app/fullcycle"]
