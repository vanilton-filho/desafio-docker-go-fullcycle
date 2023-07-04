FROM golang:alpine AS build

WORKDIR /src
COPY hello.go .

RUN go build hello.go

FROM scratch
COPY --from=build /src .
ENTRYPOINT [ "./hello" ]
