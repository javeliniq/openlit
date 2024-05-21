# Dockerfile for running docker-compose

# Use the official Docker image as the base
FROM docker:latest

# Install dependencies using apk
RUN apk update && \
    apk add --no-cache python3 py3-pip python3-dev libffi-dev openssl-dev gcc musl-dev make

# Set up a virtual environment and install docker-compose
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install docker-compose

# Make sure the virtual environment's binaries are in the PATH
ENV PATH="/opt/venv/bin:$PATH"

# Copy the docker-compose file into the container
COPY docker-compose.yml /docker-compose.yml

# Run docker-compose up when the container starts
CMD ["docker-compose", "-f", "/docker-compose.yml", "up"]
