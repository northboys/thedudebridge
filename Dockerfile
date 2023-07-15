# FROM golang:1.17

# LABEL maintainer="izalulhaq@hotmail.com"

# WORKDIR /app/thedudebridge

# # We want to populate the module cache based on the go.{mod,sum} files.
# COPY go.mod .
# COPY go.sum .

# RUN go mod download

# COPY . .

# # Build the Go app
# RUN go build -o /build/thedudebridge .


# # This container exposes port 5758 to the outside world
# EXPOSE 5758

# # Run the binary program
# CMD ["/build/thedudebridge"]

FROM golang:1.17-alpine

LABEL maintainer="izalulhaq@hotmail.com"

WORKDIR /app/thedudebridge

COPY . .

RUN go mod download && \
    go build -o /build/thedudebridge . && \
    rm -rf go.mod go.sum

EXPOSE 5758

CMD ["/build/thedudebridge"]

