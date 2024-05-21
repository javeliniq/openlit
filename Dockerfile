# Dockerfile for running docker-compose

# Use the official Docker image as the base
FROM docker:latest

# Install docker-compose
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev libffi-dev libssl-dev gcc libc-dev make && \
    pip3 install docker-compose && \
    apt-get clean


# Copy the docker-compose file into the container
COPY docker-compose.yml /docker-compose.yml

# Run docker-compose up when the container starts
CMD ["docker-compose", "-f", "/docker-compose.yml", "up"]
