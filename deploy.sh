#!/bin/bash

cd ~/web-calculator || exit

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
docker stop calculator || true
docker rm calculator || true

echo "Building new image..."
docker build -t calculator:v1 .

echo "Starting new container..."
docker run -d -p 5000:5000 --name calculator calculator:v1

echo "Deployment successful!"
