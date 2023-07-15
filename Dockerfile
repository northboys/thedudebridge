FROM golang:1.17-alpine

LABEL maintainer="izalulhaq@hotmail.com"

WORKDIR /app/thedudebridge

COPY . .

RUN go mod download && \
    go build -o /build/thedudebridge . && \
    rm -rf go.mod go.sum

EXPOSE 5758

CMD ["/build/thedudebridge"]

