# Infrastructure for the Jumia Phone Number validator

This repo uses several technologies to create a delivery pipeline for the `jumia_phone_validator` microservice. These are/include:
1. Packer
2. Bash
3. Ansible
4. Terraform

## Prerequisites
* Ensure your system has the above mentioned tools installed.
* Clone repo https://github.com/indungu/jumia_phone_validator_infrastructure
* Create ssh keys 
```bash
cd scripts
./create_ssh_keys.sh
```

## Create the base image using packer
* Start by using Packer to build the base image to be used by the servers
```bash
cd packer
packer validate base_image.pkr.hcl # note and fix any issues
packer build base_image.pkr.hcl # Take note of the AMI ID output to be used with terraform infra
```
