#!/usr/bin/env bash

OPTIONS="-y -q"

echo "always good to update the package manager apt"
 
sudo apt update

echo "see how we are configured with GitHub"

git config --list

echo "Check that GitHub can be reached via SSH"

ssh -vT git@github.com

echo "NodeJS" 
# apt install node $OPTIONS

node --version

echo "Python"
python --version

echo "Python 3"
python3 --version

echo "Golang"
# apt install go $OPTIONS

echo "validate vscode install"
code --version

echo "validate ansible" 
ansible --version

echo "Run this command to test the connection:"

ansible -m ping TestClient

echo "Verify that Docker Engine is installed correctly by running the hello-world image as sudo"

sudo docker run hello-world

echo "Verify that you can run docker commands without sudo"

docker run hello-world

# echo "htop"
# apt install htop $OPTIONS

echo "Show directory structure with excellent formatting"
# apt install tree $OPTIONS
tree --version
