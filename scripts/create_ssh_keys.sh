#!/bin/bash

## A simple script for generating ssh-keys

# Function to create jumia-phone-validator ssh-keys
create_ssh_keys() {
    ssh-keygen -t rsa -C "" -f ./jumia-phone-validator -q -P ""
}

[ -d "../ssh-keys" ] && echo "Creating ssh keys in ../ssh-keys dir" && cd ../ssh-keys \
    && create_ssh_keys \
|| echo "Creating ../ssh-keys directory and ssh keys" && mkdir -p ../ssh-keys && cd ../ssh-keys \
    && create_ssh_keys
