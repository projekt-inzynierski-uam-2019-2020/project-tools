#!/bin/bash

echo "Stopping old container..."
sudo docker stop brapi_container

echo "Removing old container..."
sudo docker rm brapi_container

echo "Removing old image..."
sudo docker rmi brapi

cd /brAPI_IPGPAS/backend

echo "Pulling update..."
git checkout brapi
git pull

echo "Building..."
mvn package

echo "Running new container..."
sudo docker build -t brapi .
sudo docker run -d -p 8080:8080 --name brapi_container brapi

echo "Done."