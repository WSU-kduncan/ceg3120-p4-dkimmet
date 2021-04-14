#! /bin/bash

# Instructions from https://docs.docker.com/engine/install/ubuntu/

echo "Hello!  My job is to install Docker on a Ubuntu Linux system.  First, I'm going to check permissions."

if [[ $EUID == 0 ]]
then
    echo "Ready to do my job."
else
    echo "Script must be run with root / sudo"
    exit;
fi

# TODO: check if docker is installed

# check that package repos are up to date
apt update

# install dependencies
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# add stable DOcker package repository to apt
# TODO: check if docker.list exists
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update now that docker package repos are added
apt update
# install docker and related packages
apt install docker-ce docker-ce-cli containerd.io