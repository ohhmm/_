# Create a Dockerfile to build an image for testing the monitoring tool

# Use an official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    iproute2 \
    iputils-ping \
    net-tools

# Copy the monitoring tool source code into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Compile the monitoring tool
RUN g++ -o monitor_route_changes monitor_route_changes.cpp

# Set the entrypoint to run the monitoring tool
ENTRYPOINT ["./monitor_route_changes"]
