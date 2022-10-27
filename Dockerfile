FROM golang:alpine AS build

WORKDIR /src/
COPY ./src/ go.* /src/
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /bin/app

FROM scratch
COPY --from=build /bin/app /bin/app
ENTRYPOINT ["/bin/app"]