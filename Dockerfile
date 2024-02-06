# Build stage
FROM golang AS build-env
ADD . /src/api-grpc-service
ENV CGO_ENABLED=0
RUN cd /src/api-grpc-service && go build -o /app

# Production stage
FROM scratch
COPY --from=build-env /app /

ENTRYPOINT ["/app"]
