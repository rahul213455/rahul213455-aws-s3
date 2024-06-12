# apt commands

sudo apt update -y
sudo apt install -y git wget
curl -s https://get.docker.com/ | sh
# sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER && newgrp docker
id $USER
sudo systemctl restart docker
_______________________________
_______________________________

# yum commands

sudo yum update -y
sudo yum intsall -y git wget
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER && newgrp docker
id $USER
sudo systemctl restart docker
