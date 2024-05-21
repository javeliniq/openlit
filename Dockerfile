# Dockerfile for running docker-compose

# Use the official Python image as the base
FROM --platform=linux/amd64 python:3.10.13

EXPOSE 4318
EXPOSE 3000
# Install dependencies using apt-get
RUN apt-get update && \
    apt-get install -y libffi-dev libssl-dev gcc musl-dev make

# Install docker-compose using pip
RUN pip install --upgrade pip && pip install pyyaml==5.3.1 && pip install docker-compose

# Copy the docker-compose file into the container
COPY docker-compose.yml /docker-compose.yml

# Entry point to run docker-compose up
CMD ["docker-compose", "-f", "/docker-compose.yml", "up", "-d"]
