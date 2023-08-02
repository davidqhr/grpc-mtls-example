FROM golang:1.20
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /bin/server ./cmd/server
RUN CGO_ENABLED=0 go build -o /bin/client ./cmd/client
# RUN CGO_ENABLED=0 go build -o /bin/raftadmin ./cmd/raftadmin