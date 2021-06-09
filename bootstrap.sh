#!/usr/bin/env bash

# Install command-line tools using Homeapt.

. "$( pwd )/utils.exclude.sh"

# Install homeapt if it is not installed
which apt 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo_with_prompt "Homeapt not installed. Attempting to install apt"
	# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homeapt/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo_with_prompt "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest eapt
apt update

# Upgrade any already-installed formulae
apt upgrade


# ---------------------------------------------
# Basic Utilities
# ---------------------------------------------

# Core Utils
apt install coreutils

# ---------------------------------------------
# SSH Keys
# ---------------------------------------------

# Create .ssh directory and generate SSH public and private keys
# Create a directory for the public keys

# In root
mkdir ~/.ssh

# chmod 700 .ssh
# cd .ssh

# Create SSH public and private keys
# Store them here

# chmod 600 private_key
# Create SSH Key for Github
# Now you need to create your SSH key for Github

ssh-keygen -t rsa -C “connors.tom@gmail.com”

# After ssh-keygen

# display the ssh public key so you can copy it
cat id_rsa.pub

# It will get saved to
# home/tom/.ssh/id_rsa             // this is the private key, very long paragraph
# home/tom/.ssh/id_rsa.pub         // this is the public key,      short paragraph
# Copy that key in that file. I would suggest using Win SCP to download the file similar to FTP
# file: ssh-rsa.pub (this is a public key you will paste in GitHub or DigitalOcean)

# - 7 lines length public key
# - a short paragraph
# - this is what you will paste into GitHub and Digitalocean
# - e1f0vfsMPOANChLOUWbSJTtf4s4P2x6CAYCOQYcd “connors.tom@gmail.com”
# file: ssh-rsa (this is your secret, it is not public):

# - -----BEGIN RSA PRIVATE KEY-----
# - really big length private key
# - -----END RSA PRIVATE KEY-----

# ---------------------------------------------
# Set the git config global values
# ---------------------------------------------

git config --global user.name coding-to-music
git config --global user.email connors.tom@gmail.com

# To validate correct setup

git config --list

# Check that GitHub can be reached

ssh -vT git@github.com

# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

OPTIONS="-y"

# NodeJS 
apt install node $OPTIONS

# Python 3
apt install python $OPTIONS

# Golang
apt install go $OPTIONS

# ---------------------------------------------
# Main Tools I use often
# ---------------------------------------------

# download vscode
# need to curl to get this debian vscode deb file:
# https://go.microsoft.com/fwlink/?LinkID=760868

# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies

#  validate install
# code --version

# The repository and key can also be installed manually with the following script:
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# ---------------------------------------------
# To install Visual Studio Code on your Ubuntu system, follow these steps:
# ---------------------------------------------

# First, update the packages index and install the dependencies by typing:

sudo apt update

sudo apt install software-properties-common apt-transport-https wget $OPTIONS

# Next, import the Microsoft GPG key using the following [wget command](https://linuxize.com/post/wget-command-examples/):

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# And enable the Visual Studio Code repository by typing:

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Once the [apt repository is enabled](https://linuxize.com/post/how-to-add-apt-repository-in-ubuntu/), install the latest version of Visual Studio Code with:

sudo apt update

sudo apt install code $OPTIONS

#  validate install
code --version

# ---------------------------------------------
# arkade -- Get Kubernetes apps the easy way
# ---------------------------------------------

curl -sLS https://dl.get-arkade.dev | sudo sh

# export PATH=$PATH:$HOME/.arkade/bin/

arkade --help

# ---------------------------------------------
# More Tools I use often
# ---------------------------------------------

# kubectl
apt install kubectl $OPTIONS

# GitHub CLI gh 
apt install gh $OPTIONS

# ansible 
apt install ansible $OPTIONS

ansible --version

# Edit the Ansible hosts file /etc/ansible/hosts to add the system that we want to manage with Ansible.

# sudo nano /etc/ansible/hosts
# Add the following:

# [TestClient]
# node1 ansible_ssh_host=192.168.0.12

# The next step is to copy the newly generated key to the other system. Run this command:

# ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.2

# ---------------------------------------------
# Test Ansible
# ---------------------------------------------

# The installation part is finished, now we can start to test Ansible

# Run this command to test the connection:

# ansible -m ping TestClient
# Output:

# node1 | SUCCESS => {
# "changed": false, 
# "ping": "pong"
# }
# In case you defined more than one client, you can test all connections with the following command:

# ansible -m ping all
# Now it’s time to run a command on the remote system and fetch the result. For this example, I’ll use the df command.

# ansible -m shell -a 'df -h' TestClient

# doctl
apt install doctl $OPTIONS

# Yarn - an alternative to npm
apt install yarn $OPTIONS

# Docker for containerization
apt install docker $OPTIONS

# htop
apt install htop $OPTIONS

# Make requests with awesome response formatting
# apt install httpie

# Show directory structure with excellent formatting
apt install tree $OPTIONS

# tmux :'D 
# apt install tmux

# gdb
# apt install gdb


# ---------------------------------------------
# Misc
# ---------------------------------------------

# Zsh 
# apt install zsh

# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
# apt tap caskroom/fonts
# apt cask install font-fira-code


# ---------------------------------------------
# Terminal gimmicks xD
# ---------------------------------------------

# The computer fortune teller 
# apt install fortune

# The famous cowsay
# apt install cowsay

# Multicolored text output
# apt install lolcat


# Remove outdated versions from the cellar
apt clean
