# Install updates
sudo apt-get -y update

#Install Docker
wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker $1

wget https://raw.githubusercontent.com/Welasco/AppServiceLinuxBootcamp/master/docker-compose.yml -O /home/$1/docker-compose.yml

printf '%s\n' 'Docker compose available at: /home/userXXX/docker-compose.yml' \
    'First Node:' \
    'docker swarm init' \
    'docker swarm join-token manager' \
    '' \
    'Second Node:' \
    'From the result of the command in the run:' \
    'Example:' \
    '    docker swarm join --token SWMTKN-1-5goua0y98v65krif4qzu4dxonn2nibrgf9aj5j76b7kjgbx0zx-630rpqu12f76zeq2h5oehat6a 10.11.0.4:2377' \
    '' \
    'Deploy a multicontainer Stack:' \
    'docker stack deploy -c docker-compose.yml nodeapp' \
    '' \
    'Additional Commands:' \
    'docker stack ps nodeapp' \
    'docker stack services nodeapp' \
    'docker node ps $(docker node ls -q) --filter desired-state=Running | uniq' \
    '' \
    '' > /home/$1/instructions.txt

