FROM golang:1.25 AS build

WORKDIR /app
COPY ./src ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/test-service .

FROM gcr.io/distroless/base-debian12
ENV PORT=8080
EXPOSE 8080
COPY --from=build /out/test-service /test-service
ENTRYPOINT ["/test-service"]
