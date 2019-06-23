sudo apt update
sudo apt -y install openjdk-8-jdk-headless maven docker.io
git clone https://github.com/projekt-inzynierski-uam-2019-2020/brAPI_IPGPAS.git
cd /brAPI_IPGPAS
git checkout brapi
cd backend
mvn package
sudo docker build -t brapi .
sudo docker run -d -p 8080:8080 --name brapi_container brapi
git checkout brapimanagementservice
cd /brAPI_IPGPAS/brapimanagementservice
mvn package
sudo docker build -t brapimanagementservice .
sudo docker run -d -p 8081:8080 --name brapimanagementservice_container brapimanagementservice