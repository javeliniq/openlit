# Dockerfile for running docker-compose

# Use the official Docker image as the base
FROM docker:latest

# Install docker-compose
RUN apk add --no-cache py-pip python3-dev libffi-dev openssl-dev gcc libc-dev make && \
    pip install docker-compose

# Copy the docker-compose file into the container
COPY docker-compose.yml /docker-compose.yml

# Run docker-compose up when the container starts
CMD ["docker-compose", "-f", "/docker-compose.yml", "up"]
