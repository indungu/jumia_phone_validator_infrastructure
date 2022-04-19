#!/bin/bash
set -x

## A script for provisioning the base image for setting up the servers

# Language and locale settings
export LANGUAGE=en_US.UTF-8 
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8 

# install required dendencies and configure noninteractive dist-upgrades
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get upgrade -y && sudo apt-get -y autoremove
sudo apt-get -y -qq install openjdk-8-jdk docker.io

# Setup sudo to allow no-password sudo for "jumia" group, adding "validator" user to necessary groups
sudo groupadd -r jumia
sudo useradd -m -s /bin/bash validator
sudo usermod -a -G jumia validator
sudo usermod -a -G docker validator
sudo cp /etc/sudoers /etc/sudoers.orig
echo "jumia  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/validator

# Adding SSH key access
sudo mkdir -p /home/validator/.ssh
sudo chmod 700 /home/validator/.ssh
sudo cp /tmp/jumia-phone-validator.pub /home/validator/.ssh/authorized_keys
sudo chmod 600 /home/validator/.ssh/authorized_keys
sudo chown -R validator /home/validator/.ssh
sudo usermod --shell /bin/bash validator

# Disable password authentication and root login over ssh
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
sudo su - root --command "cat > /etc/ssh/sshd_config.d/custom.conf <<EOF
Port 1337
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
EOF"
sudo systemctl restart sshd
