sudo apt update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y install nodejs docker.io
sudo npm install -g @angular/cli
git clone https://github.com/projekt-inzynierski-uam-2019-2020/brAPI_IPGPAS.git
cd /brAPI_IPGPAS
git checkout feature/frontend
cd frontend
npm install
ng build --prod
sudo docker build -t frontend .
sudo docker run -d -p 4200:4200 --name frontend_container frontend