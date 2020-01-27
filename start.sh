#! /bin/bash
echo " Technical task - Please Extract the AGT.zip to home folder and run start.sh inside the AGT folder"

printf "\r\n"

echo "Script Starts "
chmod 777 -R server/
cd server/

printf "\r\n"

echo "************* Update reposiory *******************"
sudo apt-get update

printf "\r\n"

echo "************* Curl install ***********************"
sudo apt-get install curl

printf "\r\n"

echo "************* Docker install *******************"
sudo curl -fsSL https://get.docker.com | sudo sh -

printf "\r\n"

echo "********** Docker compose install *******************"

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

printf "\r\n"

echo "********** set permission and enable/start docker  *******************"
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker
sudo systemctl start docker

printf "\r\n"

echo "********** Building the Docker using docker-compose and running our app ****************"
sudo docker-compose build
sudo docker-compose up -d

sudo docker ps -a 

printf "\r\n"
echo "please check Above if the container is running"
printf "\r\n"
echo "Access the graphiqlapi from localhost:4000/graphql"
printf "\r\n"
echo "Script ends here "
printf "\r\n"

#echo " Enable Below if you want to run app.js directly on ubuntu"

#curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
#sudo apt-get install -y nodejs
#sudo npm install
