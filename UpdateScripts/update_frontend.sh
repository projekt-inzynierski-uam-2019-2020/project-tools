#!/bin/bash

echo "Stopping old container..."
sudo docker stop frontend_container

echo "Removing old container..."
sudo docker rm frontend_container

echo "Removing old image..."
sudo docker rmi frontend

cd /brAPI_IPGPAS/frontend

echo "Pulling update..."
git pull

echo "Checking for package updates..."
npm install

echo "Building..."
ng build --prod

echo "Running new container..."
sudo docker build -t frontend .
sudo docker run -d -p 4200:4200 --name frontend_container frontend

echo "Done."