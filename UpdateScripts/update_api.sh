#!/bin/bash

echo "Stopping old container..."
sudo docker stop brapimanagementservice_container

echo "Removing old container..."
sudo docker rm brapimanagementservice_container

echo "Removing old image..."
sudo docker rmi brapimanagementservice

cd /brAPI_IPGPAS/brapimanagementservice

echo "Pulling update..."
git checkout brapimanagementservice
git pull

echo "Building..."
mvn package

echo "Running new container..."
sudo docker build -t brapimanagementservice .
sudo docker run -d -p 8081:8080 --name brapimanagementservice_container brapimanagementservice

echo "Done."