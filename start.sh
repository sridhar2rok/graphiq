#! /bin/bash
echo "Technical task - Please Extract the AGT.zip to home folder and run start.sh inside the AGT folder "

echo "Script Starts "
chmod 777 -R server/
cd server/

echo "************* Update repo *******************"
sudo apt-get update

echo "************* Curl install *******************"
sudo apt-get install curl

echo "************* Docker install *******************"
sudo curl -fsSL https://get.docker.com | sudo sh -

echo "********** Docker compose install *******************"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "********** set permission and enable docker  *******************"
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker
sudo systemctl start docker

sudo docker-compose build
sudo docker-compose up -d

sudo docker ps -a 

echo "please check Above if the container is running"

echo "Access the graphiqlapi from localhost:4000/graphql"

echo "Script ends here "

#echo " Enable Below if you want to run app.js directly on ubuntu"

#curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
#sudo apt-get install -y nodejs
#sudo npm install
