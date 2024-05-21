# Dockerfile for running docker-compose

# Use the official Python image as the base
FROM python:3.11-alpine

# Install dependencies using apk
RUN apk update && \
    apk add --no-cache libffi-dev openssl-dev gcc musl-dev make

# Install docker-compose using pip
RUN pip install --upgrade pip && \
    pip install docker-compose

# Copy the docker-compose file into the container
COPY docker-compose.yml /docker-compose.yml

# Entry point to run docker-compose up
CMD ["docker-compose", "-f", "/docker-compose.yml", "up"]
