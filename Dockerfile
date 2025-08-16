# Use an official Golang image as the base
FROM golang:1.21-alpine

# Install git (required for go install), bash (optional for running), and ca-certificates
RUN apk add --no-cache git bash ca-certificates && update-ca-certificates

# Set environment variables for Go
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

# Install ollama-copilot
RUN go install github.com/bernardo-bruning/ollama-copilot@v0.2.0

# Default environment variable (can be overridden at runtime)
ENV OLLAMA_HOST="http://localhost:11434"

# Set entrypoint
ENTRYPOINT ["ollama-copilot", "--model", "codellama:7b"]
