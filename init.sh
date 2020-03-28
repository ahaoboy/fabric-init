echo "init"

# install node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs


# install n
npm i n -g 

# change node v8
n 8.5.0


# install python3
sudo apt-get install python3 -y



# install docker
sudo apt-get remove -y docker docker-engine docker.io

sudo apt-get update

sudo apt-get -y install    apt-transport-https   ca-certificates    curl    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs)  stable"

sudo apt-get update

sudo apt-get install docker-ce -y

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose



# install go
# wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
# sudo tar -xzf go1.14.1.linux-amd64.tar.gz  -C /usr/local 


# echo "export GOPATH=$HOME/go" >> ~/.bashrc
# echo "export GOROOT=/usr/local/go" >> ~/.bashrc
# echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> ~/.bashrc
# source ~/.bashrc


# install gvm 
apt install bison -y
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
source ~/.bashrc
 

# clone repo
git clone https://github.com/hyperledger/fabric.git --depth=1

cd fabric
git checkout v1.4.0
./scripts/bootstrap.sh

cd ..


git clone https://github.com/hyperledger/fabric-samples.git --depth=1


cd fabric-samples
git checkout v1.4.0
curl -sS https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh -o ./scripts/bootstrap.sh

chmod +x ./scripts/bootstrap.sh

# ./scripts/bootstrap.sh [version] [ca version] [thirdparty_version]
./scripts/bootstrap.sh 1.4.0


# first-network
cd first-network

./byfn.sh generate

./byfn.sh up -l javascript



cd ..



# finish

echo "finish"
